---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Pi-Hole"
description: ""
author:
  - irish1986

weight: 1
---

# Pihole

Create a new directory for Pi-Hole and navigate into it.

```bash
mkdir -p /opt/stacks/pihole
cd /opt/stacks/pihole
nano compose.yml
```

```yaml
---
name: pihole

services:
  pihole:
    container_name: pihole
    image: ghcr.io/pi-hole/pihole:2025.04.0
    restart: unless-stopped
    hostname: ${HOSTNAME}
    ports:
      - "53:53/tcp"
      - "53:53/udp"
      - "80:80/tcp"
      - "443:443/tcp"
    env_file: .env
    cap_add:
      - SYS_TIME
      - SYS_NICE
    volumes:
      - "./pihole:/etc/pihole"
```

```bash
# This file is used to set environment variables for the Pi-hole Docker container.
TZ="America/Toronto"
FTLCONF_dns_listeningMode="all"
FTLCONF_dns_upstreams= "1.1.1.1;127.0.0.1#5053"
FTLCONF_webserver_api_password= "your-password-here"
```
