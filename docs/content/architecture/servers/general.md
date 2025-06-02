---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "General"
description: "General Server Architecture"

weight: 10
---

# General Architecture

This is how I setup my typical `Ubuntu server` regardless of the version of configuration, just the standard things out of the box.


## Manual Installation

### SSH Key

```bash
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -N '' -C ${USER}@${HOSTNAME}
```

```bash
export GH_USER="irish1986"
curl https://github.com/${GH_USER}.keys >> ~/.ssh/authorized_keys
```

### Updates

```bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
```

### Common packages

```bash
sudo apt install nfs-common
```

#### Users & Groups

setup passwordless `sudo` on Linux?

```bash
sudo visudo
${USER) ALL=(ALL) NOPASSWD:ALL
sudo visudo -c # verified it worked
```

## Security

### Firewall

## Services

### General stack

1. Deploy the following services:
   1. Watchdog
   2. Fail2Ban
   3. Docker

### Containers

I usually put my container stacks into `/opt/stacks` on all servers, it's easier for me to find all docker worload on a given server.

```bash
mkdir -p opt/stacks/
sudo chown -R groot:groot /opt/stacks/
```

## Automated Installation

### Ansible roles

```bash
ansible-playbook setup.yml -K
```
