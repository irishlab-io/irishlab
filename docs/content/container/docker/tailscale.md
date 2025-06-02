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

Create a new directory for Tailscale and navigate into it.

```bash
mkdir -p /opt/stacks/tailscale
cd /opt/stacks/tailscale
docker pull ghcr.io/tailscale/tailscale:latest # pre-load the container
nano compose.yml
```

```yaml
---
name: tailscale

services:
  tailscale:
    container_name: tailscale
    image: ghcr.io/tailscale/tailscale:v1.82.0
    restart: unless-stopped
    hostname: rpi5-2.local.irishla.io
    env_file: .env
    volumes:
      - "./tailscale/state:/var/lib/tailscale"
    devices:
      - /dev/net/tun:/dev/net/tun
    cap_add:
      - net_admin
```

```bash
nano .env
# This file is used to set environment variables for the Tailscale Docker container.
TS_AUTHKEY=tskey-client-notAReal-OAuthClientSecret1Atawk
TS_EXTRA_ARGS=--advertise-tags=tag:container
TS_STATE_DIR=/var/lib/tailscale
TS_USERSPACE=false
```
