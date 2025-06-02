---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "PeaNUT"
description: ""
author:
  - irish1986

weight: 1
---

# PeaNUT

Create a new directory for PeaNUT and navigate into it.

```bash
mkdir -p /opt/stacks/peanut
cd /opt/stacks/peanut
nano compose.yml
```

```yaml
---
name: peanut

services:
  peanut:
    container_name: peanut
    image: brandawg93/peanut:5.7.2
    restart: unless-stopped
    volumes:
      - "./config:/config"
    ports:
      - 8080:8080
    env_file: .env
```

```bash
# This file is used to set environment variables for the PeaNUT Docker container.
WEB_PORT=8080
WEB_USERNAME= "your-username-here"
WEB_PASSWORD= "your-password-here"
```

```bash
nano /opt/stacks/peanut/config/settings.yml
```

```yaml
NUT_SERVERS:
  - HOST: localhost
    PORT: 3493
    USERNAME: user
    PASSWORD: pass
INFLUX_HOST: ''
INFLUX_TOKEN: ''
INFLUX_ORG: ''
INFLUX_BUCKET: ''
INFLUX_INTERVAL: 10
```
