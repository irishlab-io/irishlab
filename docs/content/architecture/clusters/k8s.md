---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: true

title: "Kubernetes"
description: ""
author:
  - irish1986

weight: 2
---

I've always been amazed by cloud and virtualization technologies, so I decided to dive into Kubernetes and containerization. However, a few months ago, I found myself frustrated by how abstract and theoretical Kubernetes felt in online courses. I realized the best way to truly understand it was to build something real. That's how the idea of a Kubernetes homelab came to life — a hands-on project to turn my curiosity into practical skills by breaking things, fixing them, and learning along the way.

> In this first stage, I opted to deploy the cluster on bare metal due to the limited specs of my setup, but I plan to extend my homelab by adding more nodes as VMs to explore scalability and test different technologies and configurations.

## Cluster of cluster

1. Set up a K3s cluster: A lightweight Kubernetes cluster using a Beelink Mini PC as the control plane node and worker nodes distributed across additional devices like Raspberry Pis.
2. Persistent Storage: Leverage Longhorn for distributed storage and backups. Integrate with a NAS for additional S3-compatible storage using MinIO.
3. Networking and Ingress: Use MetalLB for LoadBalancer functionality and Tailscale for secure ingress.
4. Monitoring and Observability: Deploy Prometheus and Grafana for visualizing cluster health and workload performance.
5. GitOps Automation: Adopt ArgoCD for GitOps workflows, ensuring all configurations are declarative and version-controlled.
6. Applications: Run a suite of homelab apps like Uptime Kuma, Grafana, Prometheus or Home Assistant for practical use cases.
7. Federation: Experiment with federated Kubernetes clusters interconnected via Tailscale.
