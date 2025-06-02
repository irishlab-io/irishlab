---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "DNS"
description: "DNS Architecture"

weight: 23
---

# DNS Architecture

This article goes over how I am setting up my local DNS services in my homelab.  Essentially this uses Pi-hole, with Unbound, sync via Nebula Sync, secure through Tailscale VPN, and redundant with Keepalived all running on Ubuntu 24.04 as Docker container.  The goal is to deploy a High Availability local DNS services with syncronization between multiple including a recursive DNS resolver.

## Setup Ubuntu OS

To setup Ubuntu, see this post (TBD).
<!-- This should be an Ansible roles. -->

### Port 53

What to do if port 53 is already in use

When the Port 53 is already in Use, you can check this with this command (ubuntu):

Port 53 is being used at your host machine, that's why you can not bind 53 to host.

To find what is using port 53 you can do: `sudo lsof -i -P -n | grep LISTEN`

I'm a 99.9% sure that systemd-resolved is what is listening to port 53.

To solve that you need to edit the `/etc/systemd/resolved.conf` and uncomment DNSStubListener and change it to no, so it looks like this: `DNSStubListener=no`

After that reboot your system or restart the service with `service systemd-resolved restart`

```bash
sudo lsof -i -P -n | grep 53
sudo nano /etc/systemd/resolved.conf
# DNSStubListener=no
sudo service systemd-resolved restart
```

## DNS stack

1. Deploy the following services:
   1. Keepalived
   2. Watchdog
   3. Fail2Ban
   4. Docker

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
