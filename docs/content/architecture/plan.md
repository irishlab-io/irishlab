---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "The Plan"
description: ""
author:
  - irish1986

weight: 1
---

## The Plan

As Eisenhower once said, `In preparing for battle I have always found that plans are useless, but planning is indispensable`, so I am trying to plan ahead what I will be doing in this new **documented** rebuild of my homelab.

And as `Mike Tyson` also said, `Everyone has a plan 'till they get punched in the mouth`, therefore I expect things not to work 100% of the time.

## What did I build ?

My homelab design principale is essential those of a small datacenter where I host networking, compute nodes and storage nodes.  The key idea is to replicate, with my own personal preference, what I could be finding in a small datacenter and using similar techniques.

- Networking
- Compute Nodes
- Storage Nodes

Servers in on-premises datacenters are generally viewed as **pets**, whereas servers in the cloud are considered **cattle**. Pets are indispensable servers where you can make configuration changes should problems arise While, Cattle are servers that can be deleted and rebuilt from scratch in case of failures.

With the exception of the storage nodes (actually data hosted in those storage nodes), I intent to treat all servers as cattle as much as possible given my homelab should be resiliant to failure (accidental or self-inflicted).

## Design Principles

- Integrate both AMD64 and ARM64 hardware in my homelab
- Include various **additional** hardware when it makes sense (i.e.: GPU/TPU for accelerated workload, etc...)
- Run an enterprise virtualization platform based on Proxmox
  - Proxmox Datacenter Management (PDM), to provide a unified overview of all PVE clusters and nodes in my virtualized environments
  - Proxmox Virtual Environment (PVE), to provide virtualization platform designed for the provisioning of hyper-converged infrastructure
  - Proxmox Backup Server (PBS), to provide seamless centralized solution for backing up virtual machines and containers running on PVE
- Run a Kubernetes cluster hosting most services offered at home
    - Use hybrid AMD64/ARM64 nodes combining in the same cluster virtual machines and Raspberry Pi nodes.
    - Use a lightweight Kubernetes distribution (K3S) which has a smaller memory footprint which is ideal for running on Rpi.
    - Use Kubernetes distributed storage block technology for persistent storage
- Run a network attached storage (NAS) node as a centralized solution
    - Virtualized TrueNAS Scale under PVE which hardware passthrough for HBA cards
    - Provide bulk storage for media, backup and oher long term archiving solution
- Automate deployment of everything I can using using IaC (infrastructure as a code)
    - Provision PVE nodes with [Proxmox Automated Installation](https://pve.proxmox.com/wiki/Automated_Installation) to install PVE in an unattended manner.
    - Provision baremetal nodes with [cloud-init](https://cloudinit.readthedocs.io/en/latest/) to automate the initial OS installation.
    - Use [Terraform](https://developer.hashicorp.com/terraform/docs) for provisionning various ressources computing and networking.
    - Use [Ansible](https://docs.ansible.com/) for automating the configuration of the all nodes, installation, external services, and bootstrap setup.
    - [Flux CD](https://fluxcd.io/) to automatically provision Kubernetes applications from git repository.
