variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Wireguard Name"
}

variable "type" {
  type        = string
  default     = "cx11"
  sensitive   = false
  description = "Wireguard Type"
}

variable "location" {
  type        = string
  default     = "fsn1"
  sensitive   = false
  description = "Wireguard Location"
}

variable "labels" {
  type        = map(string)
  default     = {}
  sensitive   = false
  description = "Wireguard Labels"
}

variable "peers" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Wireguard Peers"
}
