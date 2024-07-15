variable "vcd_user" {}
variable "vcd_password" {}
variable "vcd_org" {}
variable "vcd_vdc" {}
variable "vcd_max_retry_timeout" {}
variable "vcd_allow_unverified_ssl" {}
variable "vcd_url" {}
variable "vcd_catalog_name" {}
variable "vcd_template_name" {}


############_network_##################
variable "edge_gateway_name" {}

variable "dns" {
  type = list(string)
}

variable "power_on" {
  type = bool
  default = true
}

variable "node" {
  type = any
}