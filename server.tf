resource "wireguard_asymmetric_key" "server" {}

resource "wireguard_asymmetric_key" "peers" {
  count = length(var.peers)
}

resource "hcloud_primary_ip" "this" {
  type          = "ipv4"
  name          = var.name
  assignee_type = "server"
  auto_delete   = false
  datacenter    = "fsn1-dc14"
}

resource "hcloud_server" "this" {
  name         = var.name
  server_type  = var.type
  location     = var.location
  image        = "ubuntu-20.04"
  labels       = var.labels
  ssh_keys     = [hcloud_ssh_key.this.id]
  firewall_ids = [hcloud_firewall.this.id]

  public_net {
    ipv4 = hcloud_primary_ip.this.id
  }

  user_data = templatefile("${path.module}/templates/create.sh", {
    private_key = wireguard_asymmetric_key.server.private_key
    peers = [for idx, val in var.peers : {
      name       = val
      public_key = wireguard_asymmetric_key.peers[idx].public_key
    }]
  })
}
