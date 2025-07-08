# 🚀 DevOps/SRE Learning Portfolio

> **An 8-week comprehensive journey to master cloud-native technologies and SRE principles**

This repository documents my structured learning journey to master DevOps and SRE skills, preparing for a role involving Kubernetes, GitOps, observability, CI/CD, and cloud technologies. Each week includes hands-on projects, configurations, scripts, and troubleshooting logs.

## 📋 Table of Contents

| Week | Focus Area | Key Technologies |
|------|------------|------------------|
| [Week 1](#week-1) | Kubernetes & Docker Foundation | Minikube, Docker, RBAC, Network Policies |
| [Week 2](#week-2) | GitOps & Developer Experience | ArgoCD, Kustomize, Helm |
| [Week 3](#week-3) | Observability Basics | Prometheus, Grafana, HPA |
| [Week 4](#week-4) | Advanced Observability | Loki, Tempo, Jaeger, OpenTelemetry |
| [Week 5](#week-5) | Service Mesh | Istio, mTLS, Circuit Breakers |
| [Week 6](#week-6) | CI/CD & SRE Principles | Jenkins, Argo Workflows, SLOs |
| [Week 7](#week-7) | Cloud & Infrastructure | AWS/EKS, GCP/GKE, Terraform |
| [Week 8](#week-8) | Advanced Topics | Databases, Chaos Engineering |

**Additional Resources:**
- [Capstone Project](#capstone-project)
- [Runbook](#runbook)
- [Interview Notes](#interview-notes)

## 🐳 Week 1: Kubernetes, Docker, Networking, and Security

### 🎯 Objective
Master Kubernetes/Docker basics, networking, security, and scripting fundamentals.

### ✅ Completed Tasks
- ✅ Deployed Nginx to Minikube, exposed as a service
- ✅ Built a Docker image for a Flask app, pushed to Docker Hub
- ✅ Configured Network Policy, RBAC, and scanned images with Trivy
- ✅ Wrote Python/Bash scripts for automation
- ✅ Set up resource limits and HPA

### 📁 Artifacts
| File | Description |
|------|-------------|
| [Dockerfile](./week1/Dockerfile) | Container configuration for Flask app |
| [Network Policy YAML](./week1/network-policy.yaml) | Kubernetes network security rules |
| [Python Script](./week1/k8s_query.py) | Automation script for K8s operations |
| [Troubleshooting Log](./week1/troubleshooting.md) | Debug session documentation |

### 🚀 Mini-Project
Deployed a Flask app with resource limits, Network Policy, and RBAC - demonstrating production-ready Kubernetes practices.

## Week 2: GitOps, Kustomize, Helm, and Developer Experience
- **Objective**: Master GitOps workflows, Kustomize, Helm, and developer collaboration.
- **Tasks**:
  - Installed ArgoCD, deployed app via GitOps.
  - Created Kustomize manifests for dev/staging environments.
  - Packaged a Flask app as a Helm chart.
  - Wrote a developer guide for Kustomize and compared Fluentd vs. Loki.
- **Artifacts**:
  - [Kustomize Manifests](./week2/kustomize/)
  - [Helm Chart](./week2/helm/)
  - [Developer Guide](./week2/developer-guide.md)
- **Mini-Project**: Deployed Flask + Redis app using Kustomize, Helm, and ArgoCD.

## Week 3: Observability (Prometheus, Grafana)
- **Objective**: Learn monitoring and metrics.
- **Tasks**:
  - Installed Prometheus/Grafana, configured metrics scraping.
  - Created Grafana dashboards for CPU/memory/HTTP metrics.
  - Set up HPA and alerts, debugged high-load issue.
- **Artifacts**:
  - [Prometheus Config](./week3/prometheus.yml)
  - [Grafana Dashboard JSON](./week3/dashboard.json)
- **Mini-Project**: Monitored a microservices app with Prometheus/Grafana and HPA.

## Week 4: Advanced Observability (Loki, Tempo, Jaeger)
- **Objective**: Master logging, tracing, and secrets management.
- **Tasks**:
  - Configured Loki for logs, Tempo/Jaeger for traces.
  - Instrumented app with OpenTelemetry, stored secrets in Kubernetes Secrets.
  - Debugged tracing/logging issues.
- **Artifacts**:
  - [OpenTelemetry Config](./week4/otel-config.yaml)
  - [Secrets YAML](./week4/secrets.yaml)
- **Mini-Project**: Deployed a multi-service app with unified observability.

## Week 5: Service Mesh (Istio)
- **Objective**: Learn Istio for microservices and security.
- **Tasks**:
  - Installed Istio, deployed Bookinfo app.
  - Configured routing, mTLS, circuit breakers, and traffic mirroring.
  - Debugged Istio issues with `istioctl`, compared Istio vs. Linkerd.
- **Artifacts**:
  - [Istio Virtual Service](./week5/virtual-service.yaml)
  - [Comparison Table](./week5/istio-vs-linkerd.md)
- **Mini-Project**: Deployed a microservices app with Istio and monitoring.

## Week 6: CI/CD and SRE Principles
- **Objective**: Master CI/CD pipelines and SRE concepts.
- **Tasks**:
  - Built Jenkins pipeline with parallel stages.
  - Created Argo Workflows for task orchestration.
  - Defined SLOs/SLIs, calculated error budget, simulated on-call response.
- **Artifacts**:
  - [Jenkinsfile](./week6/Jenkinsfile)
  - [SLO Definition](./week6/slo.md)
- **Mini-Project**: Deployed app with Jenkins/ArgoCD, monitored SLOs.

## Week 7: Cloud (AWS/EKS, GCP/GKE) and Terraform
- **Objective**: Learn cloud-native Kubernetes and IaC.
- **Tasks**:
  - Created EKS/GKE clusters, deployed apps.
  - Used Terraform to provision EKS, experimented with Cloud SQL.
  - Analyzed costs with AWS Cost Explorer.
- **Artifacts**:
  - [Terraform Scripts](./week7/terraform/)
  - [Cost Analysis](./week7/cost-analysis.md)
- **Mini-Project**: Deployed app to EKS with Terraform and Cloud SQL.

## Week 8: Databases, Chaos Engineering, and Interview Prep
- **Objective**: Learn stateful apps, chaos engineering, and interview skills.
- **Tasks**:
  - Deployed Postgres with Operator, configured backups with Velero.
  - Ran chaos experiments with LitmusChaos.
  - Designed a Kubernetes system, practiced coding and behavioral interviews.
- **Artifacts**:
  - [Postgres Operator YAML](./week8/postgres.yaml)
  - [Chaos Experiment Log](./week8/chaos.md)
  - [System Design Diagram](./week8/design.png)
- **Capstone Project**: Deployed Flask + Postgres app to EKS/GKE with Terraform, ArgoCD, Istio, and observability. Tested resilience and optimized costs.

## Runbook
- **Purpose**: Guide for deploying and managing the capstone project.
- **Steps**:
  1. Provision EKS cluster with Terraform.
  2. Deploy app with ArgoCD and Istio.
  3. Configure Prometheus/Loki/Tempo for observability.
  4. Set up SLOs and alerts.
  5. Run chaos experiments to test resilience.
- **Troubleshooting**: Common issues and fixes (e.g., pod crashes, routing failures).
- [Full Runbook](./runbook.md)

## Interview Notes
- **Technical Questions**: Kubernetes debugging, Istio routing, SLO definitions.
- **System Design**: Scalable Kubernetes architecture with observability and CI/CD.
- **Behavioral Stories**: Incident response, automation, developer collaboration.
- [Full Notes](./interview-notes.md)

## About Me
- Learning journey to become a DevOps/SRE engineer.
- Contact: [Your Email/LinkedIn]
- Date: July 2025



How the Plan Covers All DevOps/SRE Aspects
The plan addresses all core pillars of DevOps and SRE:

Automation: Python/Bash scripts, Argo Workflows.
CI/CD: Jenkins, ArgoCD, pipeline optimization.
IaC: Terraform, Kustomize, Helm.
Containerization/Orchestration: Docker, Kubernetes, Network Policies, RBAC.
Observability: Prometheus, Grafana, Loki, Tempo, Jaeger, OpenTelemetry.
Reliability Engineering: SLOs, SLIs, error budgets, incident response.
Networking/Security: Istio mTLS, Secrets, Trivy, Network Policies.
Collaboration: Developer guides, runbooks, explaining concepts.
Cloud/Multicloud: AWS/EKS, GCP/GKE, Cloud SQL, cost optimization.
Chaos Engineering: LitmusChaos for resilience testing.
Performance Optimization: HPA, resource quotas.
Tooling/Ecosystem: CNCF tools (Fluentd, Linkerd), landscape exploration.
Team Dynamics: DevOps culture, collaboration scenarios.


Tips for Success
GitHub Repo: Maintain a clean, well-organized repo with the README as the central hub. Include scripts, manifests, and screenshots.
Troubleshooting: Practice debugging daily (e.g., kubectl logs, istioctl analyze) to build operational confidence.
Interview Prep: Use the capstone project to demonstrate hands-on skills. Prepare STAR-method stories for behavioral questions (e.g., resolving a production issue).
Community Engagement: Join CNCF Slack or X DevOps/SRE groups for support and updates (e.g., follow @kelseyhightower).
Time Management: Stick to 4-6 hours/day, use catch-up days for weak areas, and prioritize hands-on practice.