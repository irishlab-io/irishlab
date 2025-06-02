---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: true

title: "Hypervisor"
description: ""
author:
  - irish1986

weight: 2
---

These hypervisors run on a conventional operating system (OS) just as other computer programs do. A virtual machine monitor runs as a process on the host, such as VirtualBox. Type-2 hypervisors abstract guest operating systems from the host operating system, effectively creating an isolated system that can be interacted with by the host. Examples of Type-2 hypervisor include VirtualBox and VMware Workstation.

## Cluster of cluster

Creating a private cloud mean that I will need to provision various workload in various environment.  Therefore I will be running [Proxmox](https://proxmox.com/) as my main virtualization environment where I can easily manage Virtual Machine (VMs) and containers (LXC), software-defined networking (SDN) , high-availability (HA) clustering, and multiple out-of-the-box tools using a single solution.

While Proxmox is a great tool, I do own a large number of Single-Board Computers (SBC) in the form of Raspberry Pi of many generations.  Those are resources limited and running a virtualization solution would curb what I can get out of these small computers.
