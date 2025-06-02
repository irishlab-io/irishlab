---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Nut"
description: ""
author:
  - irish1986

weight: 1
---

# Nut UPS

[Network UPS Tools](https://networkupstools.org/) project is to provide support for Power Devices, such as Uninterruptible Power Supplies, Power Distribution Units, Automatic Transfer Switches, Power Supply Units and Solar Controllers. NUT provides a common protocol and set of tools to monitor and manage such devices, and to consistently name equivalent features and data points, across a vast range of vendor-specific protocols and connection media types.


## Hardware consideration

Connect your UPS via USB before starting this.

## Manual Installation

```bash
lsusb
sudo apt update
sudo apt install nut nut-client nut-server
sudo nut-scanner -U
```


```bash
sudo nano /etc/nut/ups.conf
sudo nano /etc/nut/upsmon.conf
sudo nano /etc/nut/upsd.conf
sudo nano /etc/nut/nut.conf
sudo nano /etc/nut/upsd.users
sudo nano /etc/udev/rules.d/99-nut-ups.rules
```

## Automated Installation

### Ansible roles

```bash
ansible-playbook nut.yml -K
```


## Testing it
