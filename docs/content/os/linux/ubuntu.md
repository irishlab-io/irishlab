---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Ubuntu"
description: "How I setup my Ubuntu "

weight: 2
---

Ubuntu is a free and open-source Linux-based operating system developed by Canonical and a community of developers. It's a popular choice for desktop, server, and IoT devices. Ubuntu is known for its user-friendly interface, wide range of software, and strong community support.

## Setup

There are not much that needs to be done by default.  Start by updating the default installation.

```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
sudo apt install curl git wget -y
sudo apt install qemu-guest-agent -y
```

Install docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
```

## Cloud-Init
