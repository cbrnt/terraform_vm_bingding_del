locals {
  subnets  = [for s in data.vcd_network_routed_v2.net : s ]
}

resource "vcd_vm" "vm" {
  count                = var.instance_count
  name                 = var.name[count.index]
  computer_name        = var.name[count.index]
  boot_image_id        = data.vcd_catalog_item.item-from-template.id
  vapp_template_id     = data.vcd_catalog_vapp_template.from-tfvars.id
  memory               = var.memory
  cpus                 = var.cpus
  cpu_cores            = var.cpu_cores

  storage_profile      = var.storage_profile

  network {
    type               = "org"
    name               = element(local.subnets.*.name, count.index) 
    ip_allocation_mode = "DHCP"
    is_primary         = true
  }

    override_template_disk {
    bus_type        = "paravirtual"
    size_in_mb      = var.override_size
    bus_number      = 0
    unit_number     = 0
    iops            = 6000
  }

  guest_properties = {
    "local-hostname"               = element(var.local_hostname, count.index) #"${var.name[count.index]}.stg.msp.komus.net"
    "user-data"                    = base64encode(file(var.cloud-init-path)) #var.guest_properties_user-data 

  }
  
  power_on = var.power_on
}

resource "vcd_nsxt_network_dhcp_binding" "osd_bindings" {
  count = var.instance_count
  org_network_id = element(local.subnets.*.id, count.index)
  name         = "DHCP Binding for ${var.name[count.index]}"
  description  = "DHCP binding for ${var.name[count.index]}"
  binding_type = "IPV4"
  ip_address   = element(var.ip_address, count.index)
  lease_time   = 3600
  mac_address  = vcd_vm.vm[count.index].network.0.mac
  dns_servers  = var.dns
  dhcp_v4_config {
    hostname           = vcd_vm.vm[count.index].computer_name
  }
}
