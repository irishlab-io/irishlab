---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Speedtest"
description: ""
author:
  - irish1986

weight: 1
---

# Speedtest

Create a new directory for Speedtest and navigate into it.

```bash
mkdir -p /opt/stacks/speedtest
cd /opt/stacks/speedtest
nano compose.yml
```

Inside of our `compose.yml` paste:

{{% include-remote-mdsnippet "https://raw.githubusercontent.com/irishlab-io/irishlab/refs/heads/main/docker/speedtest/compose.yml" "yaml" %}}
