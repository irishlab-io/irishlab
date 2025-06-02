---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Unbound"
description: ""
author:
  - irish1986

weight: 1
---

# Unbound

[Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) is a private recursive DNS resolver. It can do what Google and the others do, but it is running locally on your LAN (on the Pi-hole host platform in most setups). The only client for your local unbound instance is typically Pi-hole. Run the commands below to install Unbound and access the directory to create the Pi-hole configuration file.  I must convert this section to utilize a Docker container.

```bash
sudo apt install unbound -y
touch /etc/unbound/unbound.conf.d/pi-hole.conf
```
Copy the Unbound configuration file from the [Pi-hole documentation](https://docs.pi-hole.net/guides/dns/unbound/#configure-unbound) and paste it into the configuration file below. You can modify this if you'd like, and there's a lot that can be done with Unbound, but we'll be using a generic setup in this tutorial.

```bash
server:
    verbosity: 0

    interface: 127.0.0.1
    port: 5335
    do-ip4: yes
    do-udp: yes
    do-tcp: yes
    do-ip6: no
    prefer-ip6: no
    harden-glue: yes
    harden-dnssec-stripped: yes
    use-caps-for-id: no
    edns-buffer-size: 1232
    prefetch: yes
    num-threads: 1
    so-rcvbuf: 1m

    # Ensure privacy of local IP ranges
    private-address: 192.168.0.0/16
    private-address: 169.254.0.0/16
    private-address: 172.16.0.0/12
    private-address: 10.0.0.0/8
    private-address: fd00::/8
    private-address: fe80::/10

```

After the file is saved, restart the Unbound service.

```bash
service unbound restart
sudo reboot now
```

Finally, you can test that Unbound is running properly by running the three commands below (found in the Unbound documentation).

```bash
dig pi-hole.net @127.0.0.1 -p 5335          # should return an IP address
dig fail01.dnssec.works @127.0.0.1 -p 5335  # should return SERVFAIL (you'll have to run it twice)
dig dnssec.works @127.0.0.1 -p 5335         # should return NOERROR
```
