# 🚀 DevOps/SRE Learning Portfolio

> **An 8-week comprehensive journey to master cloud-native technologies and SRE principles**

This repository documents my structured learning journey to master DevOps and SRE skills, preparing for a role involving Kubernetes, GitOps, observability, CI/CD, and cloud technologies. Each week includes hands-on projects, configurations, scripts, and troubleshooting logs.

## 📋 Table of Contents

| Week | Focus Area | Key Technologies |
|------|------------|------------------|
| [Week 1](#week-1) | Complete Kubernetes Foundation | Minikube, Docker, RBAC, Network Policies, StatefulSets, Helm, Monitoring, Multi-Cluster |
| [Week 2](#week-2) | Kubernetes Operators & Advanced Patterns | Controller Runtime, Custom Operators, CRDs, Admission Controllers |
| [Week 3](#week-3) | Advanced Networking & Service Mesh | Istio, mTLS, Circuit Breakers, Advanced Network Policies |
| [Week 4](#week-4) | Cloud Platforms & Infrastructure | AWS EKS, GCP GKE, Terraform, Cloud-Native Services |
| [Week 5](#week-5) | Advanced Observability & SRE | Jaeger, OpenTelemetry, Loki, SLOs, Error Budgets |
| [Week 6](#week-6) | Production Operations & Troubleshooting | Performance Optimization, Security Hardening, Backup/Restore |
| [Week 7](#week-7) | Enterprise Patterns & Architecture | Multi-Cluster Federation, Policy as Code, FinOps |
| [Week 8](#week-8) | Capstone & Interview Preparation | System Design, Chaos Engineering, Interview Practice |

**Additional Resources:**
- [Capstone Project](#capstone-project)
- [Runbook](#runbook)
- [Interview Notes](#interview-notes)

## 🐳 Week 1: Complete Kubernetes Foundation (6 Days)

### 🎯 Objective
Master Kubernetes from basics to production operations with comprehensive hands-on experience across all core concepts.

### ✅ Complete Learning Path
- **Day 1**: Kubernetes Basics - Architecture, pods, services, Minikube installation
- **Day 2**: Deployments & Configuration - ConfigMaps, Secrets, scaling, rolling updates
- **Day 3**: StatefulSets & Storage - Persistent volumes, Ingress controllers, stateful applications
- **Day 4**: Security & Monitoring - RBAC, Network Policies, Prometheus, Grafana, Helm
- **Day 5**: CI/CD & GitOps - GitHub Actions, ArgoCD, canary deployments, multi-environment
- **Day 6**: Multi-Cluster & Operations - Backup with Velero, performance optimization, cost management

### 📁 Complete Artifacts Structure
| Day | Focus Area | Key Files |
|-----|------------|-----------|
| [Day 1](./week1/Day1/) | Kubernetes Basics | index.html, README.md, practice/nginx.yaml |
| [Day 2](./week1/Day2/) | Deployments & Config | index.html, README.md, practice/deployment.yaml, service.yaml |
| [Day 3](./week1/Day3/) | StatefulSets & Storage | index.html, README.md, practice/statefulset.yaml, ingress.yaml |
| [Day 4](./week1/Day4/) | Security & Monitoring | index.html, README.md, practice/rbac.yaml, monitoring-values.yaml |
| [Day 5](./week1/Day5/) | CI/CD & GitOps | index.html, README.md, practice/ci-cd.yml, canary-rollout.yaml |
| [Day 6](./week1/Day6/) | Multi-Cluster & Ops | index.html, README.md, practice/velero-backup.yaml, cost-optimization.yaml |

### 🚀 Capstone Project
Complete production-ready Kubernetes deployment with multi-tier applications, security, monitoring, CI/CD, and operational excellence.

### 📚 **Detailed Daily Content**
- [Day 1: Kubernetes Basics](./week1/Day1/README.md) - Architecture, pods, services, installation
- [Day 2: Deployments & Configuration](./week1/Day2/README.md) - Application management and scaling
- [Day 3: StatefulSets & Storage](./week1/Day3/README.md) - Persistent data and advanced networking
- [Day 4: Security & Monitoring](./week1/Day4/README.md) - RBAC, observability, package management
- [Day 5: CI/CD & GitOps](./week1/Day5/README.md) - Automation and deployment strategies
- [Day 6: Multi-Cluster & Operations](./week1/Day6/README.md) - Enterprise operations and optimization

## Week 2: Kubernetes Operators & Advanced Patterns
- **Objective**: Master Kubernetes operators, controllers, and advanced development patterns for production applications.
- **Tasks**:
  - Built custom controllers using controller-runtime framework.
  - Created Kubernetes operators for complex stateful applications.
  - Designed CRDs and implemented reconciliation patterns.
  - Built admission controllers and validation webhooks.
- **Artifacts**:
  - [Custom Operator](./week2/operator/) - Complete operator implementation with controller-runtime
  - [CRD Definitions](./week2/crd/) - Custom resource definitions and schemas
  - [Admission Webhooks](./week2/webhook/) - Validation and mutation webhook implementations
- **Mini-Project**: Built a complete database operator that manages PostgreSQL clusters with automated failover and backups.

## Week 3: Advanced Networking & Service Mesh
- **Objective**: Master service mesh architecture, advanced networking patterns, and microservices communication.
- **Tasks**:
  - Deployed Istio service mesh with mTLS encryption.
  - Implemented circuit breakers, retries, and timeout policies.
  - Advanced network policies and CNI plugin configurations.
  - Service mesh observability and security patterns.
- **Artifacts**:
  - [Istio Configuration](./week3/istio-config/) - Complete service mesh setup with security policies
  - [Advanced Network Policies](./week3/network-policies/) - Complex networking and security rules
  - [Service Mesh Observability](./week3/observability/) - Distributed tracing and metrics configuration
- **Mini-Project**: Deployed microservices application with Istio service mesh, including canary deployments and security policies.

## Week 4: Cloud Platforms & Infrastructure
- **Objective**: Learn cloud-native Kubernetes deployment and Infrastructure as Code for production environments.
- **Tasks**:
  - Deployed and managed EKS/GKE clusters with advanced configurations.
  - Used Terraform to provision complete Kubernetes infrastructure.
  - Integrated cloud services (databases, storage, load balancers).
  - Implemented multi-cloud and hybrid cloud strategies.
- **Artifacts**:
  - [Terraform Infrastructure](./week4/terraform/) - Complete IaC for Kubernetes clusters and services
  - [Cloud Platform Configs](./week4/eks-gke/) - EKS and GKE cluster configurations
  - [Multi-Cloud Strategy](./week4/multi-cloud/) - Hybrid cloud deployment patterns
- **Mini-Project**: Deployed production application across multiple cloud providers with Terraform and cloud-native services.

## Week 5: Advanced Observability & SRE
- **Objective**: Master distributed tracing, centralized logging, and SRE principles for production systems.
- **Tasks**:
  - Implemented distributed tracing with Jaeger and OpenTelemetry.
  - Set up centralized logging with Loki and log aggregation.
  - Defined comprehensive SLOs/SLIs and implemented error budgets.
  - Built incident response processes and automated runbooks.
- **Artifacts**:
  - [Distributed Tracing](./week5/tracing/) - Jaeger and OpenTelemetry configurations
  - [Centralized Logging](./week5/logging/) - Loki and log aggregation setup
  - [SLO Definitions](./week5/slo/) - Service level objectives and error budgets
- **Mini-Project**: Implemented complete observability stack with tracing, logging, and SRE practices for a distributed system.

## Week 6: Production Operations & Troubleshooting
- **Objective**: Master production operations, advanced debugging techniques, and performance optimization.
- **Tasks**:
  - Advanced Kubernetes troubleshooting and debugging techniques.
  - Performance analysis, profiling, and optimization strategies.
  - Security hardening, compliance, and audit logging.
  - Comprehensive backup/restore strategies and disaster recovery testing.
- **Artifacts**:
  - [Debugging Guides](./week6/troubleshooting/) - Systematic troubleshooting methodologies
  - [Performance Tuning](./week6/performance/) - Optimization strategies and benchmarks
  - [Security Hardening](./week6/security/) - Production security configurations
- **Mini-Project**: Optimized a production Kubernetes cluster with comprehensive monitoring, security, and performance improvements.

## Week 7: Enterprise Patterns & Architecture
- **Objective**: Learn enterprise-grade patterns, policy management, and cost optimization strategies.
- **Tasks**:
  - Multi-cluster management, federation, and centralized governance.
  - Policy as Code implementation with Kyverno and OPA.
  - Advanced GitOps security patterns and compliance automation.
  - Cost optimization strategies and FinOps implementation.
- **Artifacts**:
  - [Multi-Cluster Management](./week7/multi-cluster/) - Federation and centralized governance
  - [Policy as Code](./week7/policies/) - Kyverno and OPA policy implementations
  - [Cost Optimization](./week7/finops/) - FinOps strategies and automation
- **Mini-Project**: Implemented enterprise-grade multi-cluster platform with policy management, cost optimization, and compliance automation.

## Week 8: Capstone & Interview Preparation
- **Objective**: System design practice, chaos engineering, and comprehensive interview preparation for DevOps/SRE roles.
- **Tasks**:
  - Designed and implemented complex Kubernetes systems architecture.
  - Chaos engineering practices with comprehensive resilience testing.
  - Production case studies, incident analysis, and war stories.
  - Technical and behavioral interview preparation with mock sessions.
- **Artifacts**:
  - [Architecture Designs](./week8/system-design/) - Complex system design documentation
  - [Chaos Experiments](./week8/chaos-engineering/) - Resilience testing and analysis
  - [Production Case Studies](./week8/case-studies/) - Real-world incident analysis and solutions
- **Capstone Project**: Designed and implemented enterprise-grade Kubernetes platform with multi-cluster management, advanced observability, policy as code, and comprehensive cost optimization - demonstrating complete DevOps/SRE mastery.

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



How the Revised Plan Covers All DevOps/SRE Aspects
The updated plan comprehensively addresses all core pillars of DevOps and SRE:

**Kubernetes Mastery**: Complete foundation from basics to advanced patterns and operators.
**Advanced Development**: Custom controllers, operators, CRDs, and admission webhooks.
**Service Mesh & Networking**: Istio, mTLS, circuit breakers, advanced network policies.
**Cloud-Native Infrastructure**: EKS/GKE, Terraform, multi-cloud strategies.
**Production Observability**: Distributed tracing, centralized logging, SLO implementation.
**Operational Excellence**: Advanced troubleshooting, performance optimization, security hardening.
**Enterprise Patterns**: Multi-cluster federation, policy as code, FinOps.
**System Architecture**: Complex system design, chaos engineering, production case studies.


Tips for Success
GitHub Repo: Maintain a clean, well-organized repo with the README as the central hub. Include scripts, manifests, and screenshots.
Troubleshooting: Practice debugging daily (e.g., kubectl logs, istioctl analyze) to build operational confidence.
Interview Prep: Use the capstone project to demonstrate hands-on skills. Prepare STAR-method stories for behavioral questions (e.g., resolving a production issue).
Community Engagement: Join CNCF Slack or X DevOps/SRE groups for support and updates (e.g., follow @kelseyhightower).
Time Management: Stick to 4-6 hours/day, use catch-up days for weak areas, and prioritize hands-on practice.