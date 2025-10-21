#!/bin/bash

# Kubernetes Cluster Maintenance Script
# This script performs routine cluster maintenance tasks

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $*"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*"
}

# Function to check cluster health
check_cluster_health() {
    log_info "Checking cluster health..."

    # Check component statuses
    if kubectl get componentstatuses >/dev/null 2>&1; then
        log_info "Component statuses:"
        kubectl get componentstatuses
    else
        log_warn "Cannot check component statuses"
    fi

    # Check node status
    log_info "Node status:"
    kubectl get nodes -o wide

    # Check pod status across namespaces
    log_info "Pod status summary:"
    kubectl get pods --all-namespaces --field-selector=status.phase!=Running -o wide || true

    # Check PVC status
    log_info "PVC status:"
    kubectl get pvc --all-namespaces
}

# Function to check resource utilization
check_resource_utilization() {
    log_info "Checking resource utilization..."

    # Check node resources
    if command -v kubectl-top &> /dev/null; then
        log_info "Node resource usage:"
        kubectl top nodes || log_warn "Cannot get node metrics"

        log_info "Pod resource usage:"
        kubectl top pods --all-namespaces || log_warn "Cannot get pod metrics"
    else
        log_warn "kubectl top plugin not available"
    fi

    # Check resource quotas
    log_info "Resource quotas:"
    kubectl get resourcequota --all-namespaces -o wide || log_warn "No resource quotas found"
}

# Function to perform backup
perform_backup() {
    log_info "Performing cluster backup..."

    if command -v velero &> /dev/null; then
        # Create backup
        velero backup create cluster-backup-$(date +%Y%m%d-%H%M%S) \
            --include-namespaces production,monitoring \
            --wait

        # List recent backups
        log_info "Recent backups:"
        velero backup get | tail -10
    else
        log_warn "Velero not installed, skipping backup"
    fi
}

# Function to clean up old resources
cleanup_resources() {
    log_info "Cleaning up old resources..."

    # Clean up completed pods older than 1 hour
    kubectl delete pods --field-selector=status.phase=Succeeded --ignore-not-found=true --all-namespaces

    # Clean up failed pods older than 24 hours
    kubectl delete pods --field-selector=status.phase=Failed --ignore-not-found=true --all-namespaces

    # Clean up old replicasets (keep last 3)
    kubectl delete replicasets --ignore-not-found=true -A -l 'app not in (monitoring,prometheus,grafana)'

    # Clean up old events (older than 1 hour)
    kubectl delete events --ignore-not-found=true --all-namespaces
}

# Function to check security
check_security() {
    log_info "Checking security status..."

    # Check for privileged containers
    local privileged_pods=$(kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{"\n"}{.metadata.namespace}{" "}{.metadata.name}{" "}{range .spec.containers[*]}{.securityContext.privileged}{end}{end}' | grep true || true)

    if [ -n "$privileged_pods" ]; then
        log_warn "Found privileged containers:"
        echo "$privileged_pods"
    else
        log_info "No privileged containers found"
    fi

    # Check for containers running as root
    local root_pods=$(kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{"\n"}{.metadata.namespace}{" "}{.metadata.name}{" "}{range .spec.containers[*]}{.securityContext.runAsUser}{end}{end}' | grep -E "(0|$)" || true)

    if [ -n "$root_pods" ]; then
        log_warn "Found containers running as root or without runAsUser:"
        echo "$root_pods"
    else
        log_info "All containers have non-root users"
    fi

    # Check network policies
    log_info "Network policies by namespace:"
    kubectl get networkpolicies --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,PODS:.spec.podSelector
}

# Function to optimize resources
optimize_resources() {
    log_info "Analyzing resource optimization opportunities..."

    # Find deployments with low resource utilization
    if command -v kubectl-top &> /dev/null; then
        log_info "Checking for over-provisioned resources..."

        # Get pods with low CPU usage
        kubectl top pods --all-namespaces --sort-by=cpu | head -10

        # Get pods with low memory usage
        kubectl top pods --all-namespaces --sort-by=memory | head -10
    fi

    # Check for unused persistent volumes
    log_info "Checking for unused persistent volumes..."
    kubectl get pv -o json | jq -r '.items[] | select(.status.phase == "Available") | .metadata.name'

    # Check for unused services
    log_info "Checking for unused services..."
    kubectl get services --all-namespaces -o json | jq -r '.items[] | select(.spec.selector == null) | .metadata.name'
}

# Function to check certificates
check_certificates() {
    log_info "Checking certificate status..."

    # Check kubeadm certificates if applicable
    if [ -d /etc/kubernetes/pki ]; then
        log_info "Certificate files in /etc/kubernetes/pki:"
        find /etc/kubernetes/pki -name "*.crt" -exec openssl x509 -in {} -noout -dates \; 2>/dev/null | head -20
    fi

    # Check certificate secrets
    log_info "Certificate secrets:"
    kubectl get certificates --all-namespaces -o wide || log_warn "No certificate resources found"
}

# Function to generate report
generate_report() {
    local report_file="cluster-health-report-$(date +%Y%m%d-%H%M%S).txt"

    log_info "Generating cluster health report: $report_file"

    {
        echo "=== Kubernetes Cluster Health Report ==="
        echo "Generated: $(date)"
        echo "Cluster: $(kubectl config current-context)"
        echo

        echo "=== Component Status ==="
        kubectl get componentstatuses || echo "Cannot get component status"
        echo

        echo "=== Node Status ==="
        kubectl get nodes -o wide || echo "Cannot get node status"
        echo

        echo "=== Namespace Status ==="
        kubectl get namespaces || echo "Cannot get namespaces"
        echo

        echo "=== Resource Usage ==="
        kubectl top nodes 2>/dev/null || echo "Metrics not available"
        kubectl top pods --all-namespaces 2>/dev/null || echo "Pod metrics not available"
        echo

        echo "=== Storage Status ==="
        kubectl get pv,pvc --all-namespaces || echo "Cannot get storage status"
        echo

        echo "=== Security Status ==="
        echo "Network Policies:"
        kubectl get networkpolicies --all-namespaces || echo "No network policies"
        echo

        echo "=== Backup Status ==="
        velero backup get 2>/dev/null | tail -5 || echo "Velero not available"

    } > "$report_file"

    log_info "Report saved to: $report_file"
}

# Main execution
main() {
    log_info "Starting cluster maintenance operations..."

    # Check if kubectl is available
    if ! command -v kubectl &> /dev/null; then
        log_error "kubectl is not installed or not in PATH"
        exit 1
    fi

    # Check cluster connectivity
    if ! kubectl cluster-info >/dev/null 2>&1; then
        log_error "Cannot connect to Kubernetes cluster"
        exit 1
    fi

    # Run maintenance tasks
    check_cluster_health
    echo

    check_resource_utilization
    echo

    check_security
    echo

    check_certificates
    echo

    optimize_resources
    echo

    # Optional: Uncomment to perform actual cleanup
    # cleanup_resources
    # echo

    # Optional: Uncomment to perform backup
    # perform_backup
    # echo

    # Generate report
    generate_report
    echo

    log_info "Cluster maintenance completed successfully!"
    log_info "Review the generated report for detailed information."
}

# Help function
show_help() {
    cat << EOF
Kubernetes Cluster Maintenance Script

Usage: $0 [OPTIONS]

Options:
    -h, --help          Show this help message
    -b, --backup        Perform backup operations
    -c, --cleanup       Clean up old resources
    -o, --optimize      Show optimization suggestions
    -r, --report        Generate health report only

Examples:
    $0                  # Run all maintenance checks
    $0 --backup         # Perform backup operations
    $0 --report         # Generate health report only

EOF
}

# Parse command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    -b|--backup)
        perform_backup
        exit 0
        ;;
    -c|--cleanup)
        cleanup_resources
        exit 0
        ;;
    -o|--optimize)
        optimize_resources
        exit 0
        ;;
    -r|--report)
        generate_report
        exit 0
        ;;
    "")
        main
        ;;
    *)
        log_error "Unknown option: $1"
        show_help
        exit 1
        ;;
esac