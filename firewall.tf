resource "hcloud_firewall" "this" {
  name = var.name

  rule {
    port            = "51820"
    protocol        = "udp"
    direction       = "in"
    destination_ips = ["0.0.0.0/0", "::/0"]
    description     = "Wireguard Traffic"
  }
  rule {
    protocol        = "icmp"
    direction       = "out"
    destination_ips = ["0.0.0.0/0", "::/0"]
    description     = "ICMP Internet Traffic"
  }
  rule {
    port            = "any"
    protocol        = "tcp"
    direction       = "out"
    destination_ips = ["0.0.0.0/0", "::/0"]
    description     = "TCP Internet Traffic"
  }
  rule {
    port            = "any"
    protocol        = "udp"
    direction       = "out"
    destination_ips = ["0.0.0.0/0", "::/0"]
    description     = "UDP Internet Traffic"
  }
}
