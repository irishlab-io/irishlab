---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Keepalived"
description: ""
author:
  - irish1986

weight: 1
---

## Keepalived

[Keepalived](https://www.keepalived.org/) is designed to run on two separate hosts but share a virtual IP address. This ensures that if one goes down (the master), the backup will take over using the same virtual IP. In this example, the virtual IP is used as our backup DNS server.

## DNS consideration

I like to pre-reserve a DNS entry for my virtual IP address (which I will call `vip` from now on).

## Manual Installation

Install Keepalived on both instances of Pi-hole where you'd like High Availability.  Get the interface name (mine is `eth0`), then modify the config file.

```bash
sudo apt install keepalived libipset13
ip a
```

Paste this information into the configuration file of the `master` and modify it as needed.

```bash
sudo nano /etc/keepalived/keepalived.conf
```

```text
global_defs {
  router_id dns-01
  max_auto_priority
  enable_script_security
  script_user groot
}

vrrp_instance VI_1 {
  state MASTER
  interface eth0
  virtual_router_id 253
  priority 100
  advert_int 1
  unicast_src_ip 192.168.1.5

  unicast_peer {
    192.168.1.7
  }

  authentication {
    auth_type PASS
    auth_pass AdfG4IJK
  }

  virtual_ipaddress {
    192.168.1.253/24
  }

}
```
Paste this information into the configuration file of the `backup` and modify it as needed.

```bash
sudo nano /etc/keepalived/keepalived.conf
```

```text
global_defs {
  router_id dns-01
  max_auto_priority
  enable_script_security
  script_user groot
}

vrrp_instance VI_1 {
  state BACKUP
  interface eth0
  virtual_router_id 253
  priority 10
  advert_int 1
  unicast_src_ip 192.168.1.7

  unicast_peer {
    192.168.1.5
  }

  authentication {
    auth_type PASS
    auth_pass AdfG4IJK
  }

  virtual_ipaddress {
    192.168.1.253/24
  }

}
```

Enable the Keepalived service on both instances, reboot, and then check the status to ensure it's running.

```bash
sudo systemctl enable --now keepalived.service
sudo reboot now
sudo systemctl status keepalived.service
```

Next, we tell the keepalived service to wait on network-online.target. Bring up an editor for overriding the keepalived.service unit:

```bash
sudo cp /usr/lib/systemd/system/keepalived.service /etc/systemd/system/keepalived.service
```

Save the file in the editor and reboot the server. The keepalived service should come up successfully after NetworkManager signals that all of the network devices are online.

```bash
sudo systemctl reload keepalived.service
sudo systemctl status keepalived.service
```

## Automated Installation

### Ansible roles

```bash
ansible-playbook keepalived.yml -K
```

## Testing it

See what is going on.


Let's do a quick test

```bash
watch systemctl status keepalived.service .5 # on the second node
sudo systemctl stop keepalived.service # on the first node
```


---


### Setup Keepalived

[Keepalived](https://www.keepalived.org/) is designed to run on two separate hosts but share a virtual IP address. This ensures that if one goes down (the master), the backup will take over using the same virtual IP. In this example, the virtual IP is used as our backup DNS server.

Install Keepalived on both instances of Pi-hole where you'd like High Availability.

```bash
sudo apt install keepalived -y
```

On the first node, get the interface name (mine is **eth0**), then modify the config file.

```bash
ip a
touch /etc/keepalived/keepalived.conf
```

Paste this information into the configuration file of the **master** and modify it as needed.

```bash
vrrp_instance VI_1 {
  state MASTER
  interface eth0
  virtual_router_id 10 # use your vip ip
  advert_int 1
  unicast_src_ip 10.0.10.5 # ip of the first-node acting as master
  unicast_peer {
    10.0.10.6 # ip of the second-node acting as backup
  }
  priority 20
  authentication {
    auth_type PASS
    auth_pass <"generate-your-pass"> # tr -dc A-Za-z0-9 </dev/urandom | head -c 13; echo
  }
  virtual_ipaddress {
    10.0.10.10/24 # ip vip keepalived will use
  }
}
```

Run the same commands on the **backup** Pi-hole instance, then paste this information into the Keepalived configuration file:

```bash
vrrp_instance VI_1 {
  state BACKUP
  interface eth0
  virtual_router_id 10
  advert_int 1
  unicast_src_ip 10.0.10.6
  unicast_peer {
    10.0.10.5
  }
  priority 10
  authentication {
    auth_type PASS
    auth_pass <"use-your-generated-pass">
  }
  virtual_ipaddress {
    10.0.10.10/24
  }
}
```

Enable the Keepalived service on both instances, reboot, and then check the status to ensure it's running.

```bash
sudo systemctl enable keepalived.service
sudo reboot now
sudo systemctl status keepalived.service
```

At this point, if you reboot the **master** and keep the status window open, the **backup** should kick in.
