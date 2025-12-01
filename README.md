# sre-demo-1
SRE Demo Project – Terraform, Azure, GitHub Actions, Python automation, Docker, Kubernetes, Prometheus, Grafana

# SRE Demo Project – AKS, Terraform, Observability

This repo is a personal Site Reliability Engineering (SRE) lab project to showcase:
- Containerized Python app with health & metrics endpoints
- Docker packaging
- Azure Kubernetes Service (AKS) deployment
- Terraform-based Infrastructure as Code (IaC)
- Azure Container Registry (ACR) and PostgreSQL
- CI with GitHub Actions (build & push Docker image)
- Future: Observability stack (Prometheus, Grafana, alerts, SLOs)

---

## Tech Stack

- **Language:** Python (Flask)
- **Containerization:** Docker
- **Orchestration:** Azure Kubernetes Service (AKS)
- **IaC:** Terraform (azurerm provider)
- **Registry:** Azure Container Registry (ACR)
- **Database:** Azure PostgreSQL Flexible Server
- **CI:** GitHub Actions
- **Monitoring (planned):** Prometheus, Grafana
- **Alerting (planned):** Alert rules, SLO/Error budget dashboards

---

## Git Workflow & Branching Model

This project uses a simple Git workflow inspired by GitFlow but optimized for a single engineer.

### Branches

- **`main`**  
  Stable branch. Always contains deployable infrastructure and app code.

- **`feature/*`**  
  Short-lived branches used to develop new features or changes.  
  Examples:
  - `feature/readme-workflow`
  - `feature/add-monitoring`
  - `feature/update-aks-sku`

### Typical Workflow

1. Create a feature branch:
   ```bash
   git checkout -b feature/<name>
2. Make changes and test locally.
3. Stage and commit:
    git add .
    git commit -m "Describe the change clearly"
4. Switch back to main and merge:
    git checkout main
    git merge feature/<name>
5. Push the updated main branch:
    git push origin main

-------------------------------------------------------------------------------------
Project Overview

This project demonstrates a full SRE-style end-to-end deployment pipeline using:

Terraform – Infrastructure as Code
Azure Kubernetes Service (AKS) – Container orchestration
Azure Container Registry (ACR) – Container image storage
Docker – Building application images
Kubernetes Manifests – Deploying workloads
Git tagging & workflows – Versioned & auditable changes

This repo is structured exactly like a real-world SRE or DevOps project.
-------------------------------------------------------------------------------------
Infrastructure Architecture

Terraform provisions:

Component	                          Purpose
Resource Group	                    Logical Azure container
Virtual Network + Subnets	          Network segmentation for AKS & Postgres
AKS Cluster	                        Runs application workloads
ACR Registry	                      Stores container images
Postgres Flexible Server	          Database
Outputs	                            Exposes useful AKS credentials, ACR, etc.

Terraform backend: local state stored in terraform/terraform.tfstate (gitignored).
-------------------------------------------------------------------------------------
Repository Structure
sre-demo-1/
│
├── app/                 # Application source code and Dockerfile
│
├── k8s/                 # Kubernetes manifests
│   ├── deployment.yaml
│   └── service.yaml
│
├── terraform/           # Infrastructure as Code (Terraform)
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── aks.tf
│   ├── acr.tf
│   ├── network.tf
│   ├── postgres.tf
│   └── terraform.tfstate (ignored)
│
├── .gitignore
└── README.md
-------------------------------------------------------------------------------------
Git Workflow

This project follows a simple, scalable Git workflow.

Branching Model

main — Always stable and deployable

feature/* — Used for isolated development work

Example:

git checkout -b feature/update-readme
# commit work
git push origin feature/update-readme
# open pull request into main

Tagging Model

Infrastructure and application versions are tagged independently.

Infrastructure Tags:

infra-v0.1.0 – Initial setup: AKS + ACR + Postgres + Networking
infra-v0.2.0 – (Future) Add Prometheus and Grafana
infra-v0.3.0 – (Future) Add SLO dashboards and alerting


Application Tags:

app-v0.1.0 – First application deployment to AKS using ACR image
app-v0.2.0 – (Future) Expanded features, configmaps, secrets


To create a tag:

git tag -a app-v0.1.0 -m "First application deployment to AKS"
git push origin app-v0.1.0
-------------------------------------------------------------------------------------
Terraform Workflow
Initialize Terraform
cd terraform
terraform init

See the planned changes
terraform plan

Save a plan for predictable execution
terraform plan -out=sre-demo.tfplan

Apply infrastructure
terraform apply "sre-demo.tfplan"

Destroy infrastructure (when needed)
terraform destroy
-------------------------------------------------------------------------------------
Application Build and Push Workflow
Build the Docker image
docker build -t sre-demo-app:v0.1.0 app/

Tag the image for ACR
docker tag sre-demo-app:v0.1.0 sredemoacr01.azurecr.io/sre-demo-app:v0.1.0

Push to ACR
docker push sredemoacr01.azurecr.io/sre-demo-app:v0.1.0
-------------------------------------------------------------------------------------
Kubernetes Deployment Workflow
Connect to AKS
az aks get-credentials --resource-group rg-sre-demo --name sre-demo-aks


Check nodes:

kubectl get nodes

Deploy application
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Check status
kubectl get pods -w
kubectl get svc

Access the application (LoadBalancer)

The service should show an external IP:

kubectl get svc sre-demo-service


Browse to:

http://<EXTERNAL-IP>
-------------------------------------------------------------------------------------
Deployment Flow Summary

Write or modify code under app/
Build the Docker image
Push the image to ACR
Update Kubernetes manifests if needed
Apply manifests to AKS
Verify pods and services
-------------------------------------------------------------------------------------
Future Enhancements (Roadmap)
Enhancement	                    Description
Prometheus	                    Metrics collection
Grafana	                        Dashboards for SRE observability
Alertmanager	                  Alerts on failures or SLO violations
Application CI/CD	              GitHub Actions for automated builds
Terraform Pipelines	            Plan & apply via PR workflows
ConfigMaps & Secrets	          For managing environment configuration
-------------------------------------------------------------------------------------
Notes

All cloud credentials and secrets must be kept out of Git.
Terraform state files must never be committed.
Tags help maintain a clean historical audit trail.
-------------------------------------------------------------------------------------