---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Watchdog"
description: ""
author:
  - irish1986

weight: 5
---

## Watchdog

In Linux, a watchdog is a mechanism, either hardware or software, that monitors the system's health and automatically reboots it if it becomes unresponsive or crashes. It works by periodically sending a "heartbeat" signal to a timer. If the system fails to send the heartbeat within a specific timeframe, the watchdog triggers a reboot.
Here's a more detailed breakdown:
Purpose:
The primary goal of a watchdog is to ensure the system remains operational, even in the face of software bugs or hardware failures.
Mechanism:
The watchdog, often implemented as a hardware timer or software daemon, continuously monitors the system. It sends a "kick" or "heartbeat" signal to a timer at regular intervals.
Reboot Trigger:
If the system fails to send the heartbeat within the timeout period, the watchdog assumes the system is unresponsive and triggers a reboot. This can be a hardware reset or a software-initiated reboot, depending on the implementation.
Types:
Hardware Watchdogs: These are dedicated hardware chips that monitor the system and can directly trigger a reset.
Software Watchdogs: These are software programs that monitor the system and can trigger a software-initiated reboot.
Linux Implementation:
In Linux, the watchdog is often represented by a special device file, /dev/watchdog. Software daemons like watchdog write to this file to "kick" the watchdog, preventing it from triggering a reboot.
Benefits:
Watchdogs are particularly useful in embedded systems and servers that need to operate without human intervention for extended periods. They help ensure high reliability and availability.


## Hardware consideration

### RPi


```bash
ls -la /dev/watchdog*
echo "dtparam=watchdog=on" >> "/boot/firmware/config.txt"
```

### Proxmox Host

### Proxmox Guest

## Manual Installation

```bash
ls -la /dev/watchdog*
sudo apt update
sudo apt upgrade
sudo apt install watchdog -y
sudo nano /etc/watchdog.conf
```

Edit watchdog timer with command:

```text
interval         = 1
max-load-1       = 24
max-load-15      = 12
max-load-5       = 18
min-memory       = 1280
interface        = eth0
ping             = 1.1.1.1
priority         = 1
realtime         = yes
watchdog-device  = /dev/watchdog
watchdog-timeout = 15
```

Details are in the [official documentation](https://linux.die.net/man/5/watchdog.conf).

There are a lot of parameters there, I suggest paying attention to interface and ping. You can reboot the device if there is no activity on the network interface or if some ip address is unavailable. Like ping = 8.8.8.8

Small note **do not use tabs** in lines – the watchdog will ignore such lines.
And the second note: Raspberry Pi only supports a maximum of 15 seconds for watchdog-timeout.


```bash
sudo systemctl enable watchdog
sudo systemctl start watchdog
sudo systemctl status watchdog
```

## Automated Installation

### Ansible roles

```bash
ansible-playbook watchdog.yml -K
```

## Testing it

See what is going on.

```bash
sudo wdctl
```

This will fork bomb our server, use it with caution.  This is a good test to create a **controled crash** on your server (or mess with your friends).

```bash
sudo bash -c ':(){ :|:& };:'
```

It feels that nothing happens, but in few seconds the terminal becomes slow and unresponsive. The connection got lost and I could not access. The ping from my local computer showed:
