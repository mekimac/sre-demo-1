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
