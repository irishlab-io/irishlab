---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Tailscale"
description: ""
author:
  - irish1986

weight: 1
---

# Tailscale


[Tailscale](https://www.tailscale.com/) makes creating software-defined networks easy: securely connecting users, services, and devices.  I am using my DNS servers as VPN **exit-nodes** which exposes my services outside of my local network while adding a layer of security during my travel.

These steps are for Ubuntu 24.04 (noble) and once I convert this to Ansible it should be automated.

```bash
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/noble.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
sudo apt-get update
sudo apt-get install tailscale -y
```

Connect your machine to your Tailscale network and authenticate in your browser:

```bash
sudo tailscale up  --accept-dns=false --advertise-exit-node --advertise-routes=10.0.10.0/24
sudo tailscale set --auto-update
```

Tailscale [documentation](https://tailscale.com/kb/1114/pi-hole) is good to follow from here.
