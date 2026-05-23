# ☁️ AWS Monitoring Stack using Terraform + Docker + Prometheus + Grafana

## 🚀 Overview

This project automates the deployment of a complete cloud monitoring system on AWS using Terraform.

An EC2 instance is provisioned and automatically configured with Docker, Prometheus, Node Exporter, and Grafana for real-time system monitoring and visualization.

---

## 🎯 Features

- Infrastructure as Code using Terraform
- Automated AWS EC2 provisioning
- Docker-based monitoring stack
- Node Exporter for system metrics
- Prometheus for metrics collection
- Grafana for visualization dashboards

---

## 🏗️ Architecture

Terraform → AWS EC2 (t3.micro) → Docker → Node Exporter → Prometheus → Grafana → Dashboard

---

## 🛠️ Tech Stack

- AWS EC2
- Terraform
- Docker
- Prometheus
- Grafana
- Ubuntu

---

## 📁 Project Structure

terraform-monitoring/
│── main.tf
│── README.md

---

## 🚀 Deployment Steps

### 1. Initialize Terraform
-terraform init
-2. Validate Configuration
-terraform plan
-3. Deploy Infrastructure
-terraform apply
-Type:yes
-🌐 Access Services

-Grafana:
-http://<PUBLIC_IP>:3000
-Login: admin / admin

-Prometheus:
-http://<PUBLIC_IP>:9090
 -Grafana Setup
-Go to Connections → Data Sources
-Add Prometheus
-URL:
-http://<PUBLIC_IP>:9090
-Click Save & Test
-📥 Import Dashboard
-Go to Dashboards → Import
-Enter ID: 1860
-Select Prometheus
-Click Import
-📈 Metrics Displayed
-CPU Usage
-Memory Usage
-Disk Usage
-Network Traffic
-System Uptime
