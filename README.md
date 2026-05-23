**# ☁️ AWS Monitoring Stack

> Automated cloud monitoring using Terraform + Docker + Prometheus + Grafana

## Overview

This project provisions a complete monitoring system on AWS using Infrastructure as Code. A single `terraform apply` spins up an EC2 instance pre-configured with Docker, Prometheus, Node Exporter, and Grafana — ready for real-time system metrics and visualization.

---

## Features

- **Infrastructure as Code** — reproducible AWS provisioning via Terraform
- **Automated EC2 setup** — no manual configuration required
- **Docker-based stack** — containerized services for easy management
- **Node Exporter** — exposes system-level metrics (CPU, memory, disk, network)
- **Prometheus** — metrics scraping and storage
- **Grafana** — rich dashboards and visualization

---

## Architecture** Terraform → AWS EC2 (t3.micro) → Docker → Node Exporter → Prometheus → Grafana
---

## Tech Stack

| Tool | Purpose |
|------|---------|
| AWS EC2 | Compute instance |
| Terraform | Infrastructure provisioning |
| Docker | Container runtime |
| Prometheus | Metrics collection |
| Node Exporter | System metrics exporter |
| Grafana | Visualization & dashboards |
| Ubuntu | Base OS |

---

## Project Structure
terraform-monitoring/
├── main.tf
└── README.md
---

## Deployment

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Preview Changes

```bash
terraform plan
```

### 3. Deploy

```bash
terraform apply
```

When prompted, type `yes` to confirm.

---

## Accessing Services

Once deployed, replace `<PUBLIC_IP>` with your EC2 instance's public IP address.

| Service | URL | Default Credentials |
|---------|-----|---------------------|
| Grafana | `http://<PUBLIC_IP>:3000` | `admin` / `admin` |
| Prometheus | `http://<PUBLIC_IP>:9090` | — |

---

## Grafana Setup

### Connect Prometheus as a Data Source

1. Go to **Connections → Data Sources**
2. Click **Add data source** and select **Prometheus**
3. Set the URL to `http://<PUBLIC_IP>:9090`
4. Click **Save & Test**

### Import a Dashboard

1. Go to **Dashboards → Import**
2. Enter dashboard ID `1860`
3. Select your Prometheus data source
4. Click **Import**

---

## Metrics Displayed

- CPU Usage
- Memory Usage
- Disk Usage
- Network Traffic
- System Uptime
