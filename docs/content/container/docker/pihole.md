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

Create a new directory for Pi-Hole and navigate into it.

```bash
mkdir -p /opt/stacks/pihole
cd /opt/stacks/pihole
nano compose.yml
nano .env
```

Inside of our `compose.yml` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/pihole/compose.yml" "yaml" %}}

Inside of our `.env` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/pihole/sample.env" "yaml" %}}
