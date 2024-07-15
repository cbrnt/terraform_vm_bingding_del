variable "instance_count" {
  type = number
}

variable "name" {
  type = any
}

variable "memory" {
  type = number
}

variable "cpus" {
  type = number
}

variable "cpu_cores" {
  type = number
}

variable "disk" {
  type = bool
}

variable "power_on" {
  type = bool
}  

variable "ip_address" {
  type = any
}

variable "dns" {
  type = list(string)
}

variable "local_hostname" {
  type = list(string)
}

variable "network" {
  
}

variable "cloud-init-path" {
  type = string
}

variable "storage_profile" {
  type = string
}

variable "size_in_mb" {
  type = string
  default = "10"
}

variable "edge_gateway_name" {
  type = string  
}

variable "vcd_catalog_name" {
  type = string
}

variable "vcd_template_name" {
  type = string
}

variable "override_size" {
  type = any
}