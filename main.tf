module "vm" {
  source = "./vm"
  for_each = { for r in var.node : r.name[0] => r }
  instance_count                  = each.value.count
  name                            = each.value.name
  edge_gateway_name               = var.edge_gateway_name 
  vcd_catalog_name                = var.vcd_catalog_name
  vcd_template_name               = var.vcd_template_name
  memory                          = each.value.memory
  cpus                            = each.value.cpus
  cpu_cores                       = each.value.cpu_cores
  local_hostname                  = each.value.local_hostname
  power_on                        = var.power_on
  network                         = each.value.networks
  ip_address                      = each.value.host
  dns                             = var.dns
  override_size                   = each.value.override_size
  disk                            = each.value.disk
  size_in_mb                      = each.value.size_in_mb
  storage_profile                 = each.value.storage_profile
  cloud-init-path                 = each.value.cloud-init-path
}