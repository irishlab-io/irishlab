---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Traefik"
description: ""
author:
  - irish1986

weight: 1
---

Create a new directory for Traefik and navigate into it.

```bash
mkdir -p /opt/stacks/traefik
mkdir -p /opt/stacks/traefik/data
touch /opt/stacks/traefik/data/acme.json
chmod 0600 /opt/stacks/traefik/data/acme.json
cd /opt/stacks/traefik
nano compose.yml
nano .env
```

Inside of our `compose.yml` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/traefik/compose.yml" "yaml" %}}

Inside of our `.env` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/traefik/sample.env" "yaml" %}}
