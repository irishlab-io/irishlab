terraform {
  required_version = ">= 0.15"
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "3.4.3"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}
