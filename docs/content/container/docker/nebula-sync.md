---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Nebula-Sync"
description: ""
author:
  - irish1986

weight: 1
---

# Nebula-Sync

Create a new directory for Nebula Sync and navigate into it.

```bash
mkdir -p /opt/stacks/nebula-sync
cd /opt/stacks/nebula-sync
```
Create our compose file.

```bash
docker pull ghcr.io/lovelaze/nebula-sync:v0.10.0 # pre-load the container
nano compose.yml
```

Inside of our `compose.yml` paste:

```yaml
---
name: nebula-sync

services:
  nebula-sync:
    container_name: nebula-sync
    image: ghcr.io/lovelaze/nebula-sync:v0.10.0
    restart: unless-stopped
    env_file: .env
```

Create our `.env` with our variables.

Replace with your server IPs, passwords, timezone, and how frequently you want so run this sync job.

```bash
# This file is used to set environment variables for the Nebula-Sync Docker container.
PRIMARY="http://192.168.1.5|abc123"
REPLICAS="http://192.168.1.6|abc123,http://192.168.1.7|abc123"
FULL_SYNC=false
RUN_GRAVITY=true
CRON=*/15 * * * * # every 15min

CLIENT_SKIP_TLS_VERIFICATION=true
CLIENT_RETRY_DELAY_SECONDS=5
CLIENT_TIMEOUT_SECONDS=60

TZ="America/Toronto"

SYNC_CONFIG_DATABASE=false
SYNC_CONFIG_DEBUG=false
SYNC_CONFIG_DHCP=false
SYNC_CONFIG_DNS=true
SYNC_CONFIG_MISC=false
SYNC_CONFIG_NTP=false
SYNC_CONFIG_RESOLVER=false
SYNC_GRAVITY_AD_LIST_BY_GROUP=true
SYNC_GRAVITY_AD_LIST=true
SYNC_GRAVITY_CLIENT_BY_GROUP=false
SYNC_GRAVITY_CLIENT=false
SYNC_GRAVITY_DHCP_LEASES=false
SYNC_GRAVITY_DOMAIN_LIST_BY_GROUP=true
SYNC_GRAVITY_DOMAIN_LIST=true
SYNC_GRAVITY_GROUP=true
```

Start our compose stack as a daemon.  Optionnaly, we can look at the logs and others related informations.

```bash
docker compose up -d
docker ps | grep nebula
docker logs nebula-sync
```
