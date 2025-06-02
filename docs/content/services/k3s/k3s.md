---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "K3S Install"
description: "Text about this post"

weight: 32
---

Master / Control
In our case: control01

This is our primary node.

We are going to install the K3s version of Kubernetes, that is lightweight enough for out single board computers to handle. Use the following command to download and initialize K3s' master node.

```bash
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable servicelb --token some_random_password --node-taint CriticalAddonsOnly=true:NoExecute --bind-address 192.168.0.10 --disable-cloud-controller --disable local-storage
```

Some explanations:

- --write-kubeconfig-mode 644 - This is the mode that we want to use for the kubeconfig file. Its optional, but needed if you want to connect to Rancher manager later on.
- --token - This is the token that we want to use to connect to the K3s master node. Choose a random password, but keep remember it.
- --disable-cloud-controller - This is the flag that we want to use to disable the K3s cloud controller. I don't think I need it.
- --disable local-storage - This is the flag that we want to use to disable the K3s local storage. I'm going to setup longhorn storage provider instead.
- --disable servicelb - This is the flag that we want to use to disable the service load balancer. (We will use metallb instead)
- --node-taint - This is the flag that we want to use to add a taint to the K3s master node. I'll explain taints later on, but it will mark the node to not run any containers except the ones that are critical.
- --bind-address - This is the flag that we want to use to bind the K3s master node to a specific IP address.
