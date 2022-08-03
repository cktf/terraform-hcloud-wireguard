resource "hcloud_firewall" "this" {
  name = var.name

  rule {
    port            = "51820"
    protocol        = "udp"
    direction       = "in"
    destination_ips = ["0.0.0.0/0", "::/0"]
    description     = "Wireguard Traffic"
  }
}
