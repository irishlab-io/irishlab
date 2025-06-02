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
nano compose.yml
```

Inside of our `compose.yml` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/tailscale/compose.yml" "yaml" %}}
