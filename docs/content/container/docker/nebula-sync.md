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
docker pull ghcr.io/lovelaze/nebula-sync:latest # pre-load the container
nano compose.yml
```

Inside of our `compose.yml` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/nebula-sync/compose.yml" "yaml" %}}
