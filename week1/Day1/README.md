### Week 1: Kubernetes, Docker, Networking, and Security
## Goal: Build a strong foundation in Kubernetes, Docker, scripting, and security basics.

# Daily Breakdown (4-6 hours/day):

# Day 1: Kubernetes Basics (6 hours)
* Learn: Kubernetes architecture (control plane, nodes, pods, services, deployments).
* Resources: Kubernetes docs (kubernetes.io), FreeCodeCamp Kubernetes course (freecodecamp.org).
* Practice: Install Minikube/Kind, deploy an Nginx pod using kubectl apply -f, expose it as a service, and access it.
*  Task: Document kubectl commands in your README.

## Kubernetes Architecture

A Kubernetes cluster consists of two main types of components: the **Control Plane** and the **Worker Nodes**.

### Control Plane

The Control Plane is the brain of the cluster. It manages the overall state of the applications and the cluster itself. Its core components are:

*   **kube-apiserver:** The entry point for all cluster communication. It exposes the Kubernetes API.
*   **etcd:** A consistent and highly-available key-value store that acts as the single source of truth for all cluster data.
*   **kube-scheduler:** Watches for newly created Pods and assigns them to a healthy Worker Node based on resource requirements and other constraints.
*   **kube-controller-manager:** Runs various controller processes that regulate the state of the cluster, ensuring the current state matches the desired state.
*   **cloud-controller-manager:** (Optional) Integrates with the underlying cloud provider's infrastructure for features like load balancers and storage.

### Worker Nodes

Worker Nodes are the machines (virtual or physical) where your containerized applications run. Each worker node contains:

*   **kubelet:** An agent that runs on each node. It communicates with the Control Plane to ensure containers are running in a Pod as specified.
*   **kube-proxy:** A network proxy that runs on each node, maintaining network rules and enabling communication to your Pods from inside or outside the cluster.
*   **Container Runtime:** The software responsible for running containers. Kubernetes supports runtimes like containerd and CRI-O (and formerly Docker).

## Kubernetes Architecture Diagram

```mermaid
graph TB
    subgraph "Control Plane"
        API[kube-apiserver<br/>API Server]
        ETCD[etcd<br/>Key-Value Store]
        SCHED[kube-scheduler<br/>Scheduler]
        CM[kube-controller-manager<br/>Controller Manager]
        CCM[cloud-controller-manager<br/>Cloud Controller]
    end
    
    subgraph "Worker Node 1"
        KUBELET1[kubelet<br/>Node Agent]
        PROXY1[kube-proxy<br/>Network Proxy]
        RUNTIME1[Container Runtime<br/>containerd/CRI-O]
        POD1[Pod 1<br/>App Container]
        POD2[Pod 2<br/>App Container]
    end
    
    subgraph "Worker Node 2"
        KUBELET2[kubelet<br/>Node Agent]
        PROXY2[kube-proxy<br/>Network Proxy]
        RUNTIME2[Container Runtime<br/>containerd/CRI-O]
        POD3[Pod 3<br/>App Container]
        POD4[Pod 4<br/>App Container]
    end
    
    subgraph "Worker Node N"
        KUBELETN[kubelet<br/>Node Agent]
        PROXYN[kube-proxy<br/>Network Proxy]
        RUNTIMEN[Container Runtime<br/>containerd/CRI-O]
        PODN1[Pod N<br/>App Container]
    end
    
    %% Control Plane connections
    API --> ETCD
    API --> SCHED
    API --> CM
    API --> CCM
    
    %% API Server to Worker Nodes
    API -.->|API Calls| KUBELET1
    API -.->|API Calls| KUBELET2
    API -.->|API Calls| KUBELETN
    
    %% Worker Node internal connections
    KUBELET1 --> RUNTIME1
    KUBELET2 --> RUNTIME2
    KUBELETN --> RUNTIMEN
    
    RUNTIME1 --> POD1
    RUNTIME1 --> POD2
    RUNTIME2 --> POD3
    RUNTIME2 --> POD4
    RUNTIMEN --> PODN1
    
    %% Network proxy connections
    PROXY1 -.->|Network Rules| POD1
    PROXY1 -.->|Network Rules| POD2
    PROXY2 -.->|Network Rules| POD3
    PROXY2 -.->|Network Rules| POD4
    PROXYN -.->|Network Rules| PODN1
    
    %% Styling
    classDef controlPlane fill:#e1f5fe,stroke:#01579b,stroke-width:2px
    classDef workerNode fill:#f3e5f5,stroke:#4a148c,stroke-width:2px
    classDef pod fill:#e8f5e8,stroke:#2e7d32,stroke-width:1px
    
    class API,ETCD,SCHED,CM,CCM controlPlane
    class KUBELET1,PROXY1,RUNTIME1,KUBELET2,PROXY2,RUNTIME2,KUBELETN,PROXYN,RUNTIMEN workerNode
    class POD1,POD2,POD3,POD4,PODN1 pod
```

### Architecture Components Explained

#### Control Plane Components
- **kube-apiserver**: Central API server that all components communicate with
- **etcd**: Distributed key-value store for cluster state
- **kube-scheduler**: Assigns pods to nodes based on constraints
- **kube-controller-manager**: Runs controllers for different resources
- **cloud-controller-manager**: Integrates with cloud provider APIs

#### Worker Node Components
- **kubelet**: Primary node agent that manages pod lifecycle
- **kube-proxy**: Network proxy for pod-to-pod communication
- **Container Runtime**: Software that runs containers (containerd, CRI-O)

#### Communication Flow
1. **API Server** is the central hub for all cluster communication
2. **etcd** stores the cluster state and configuration
3. **Scheduler** watches for new pods and assigns them to nodes
4. **kubelet** on each node receives pod specifications and manages containers
5. **kube-proxy** handles networking between pods and services



