terraform {
  required_version = ">= 0.14.0"
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.0"
    }
    wireguard = {
      source  = "ojford/wireguard"
      version = "~> 0.2.1+1"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.35.0"
    }
  }
}
