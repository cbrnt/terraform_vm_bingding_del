data "vcd_vdc_group" "group1" {
  name = "dcg_176873"
}

data "vcd_nsxt_edgegateway" "name" {
  owner_id = data.vcd_vdc_group.group1.id
  name = var.edge_gateway_name
}

data "vcd_catalog_item" "item-from-template" {
  catalog = var.vcd_catalog_name
  name    = var.vcd_template_name
}

data "vcd_catalog" "my-cat" {
  name = var.vcd_catalog_name
}

data "vcd_catalog_vapp_template" "from-tfvars" {
  catalog_id = data.vcd_catalog.my-cat.id
  name       = var.vcd_template_name
}

data "vcd_network_routed_v2" "net" {
  for_each = toset(var.network)
  name = each.key
  edge_gateway_id = data.vcd_nsxt_edgegateway.name.id
}

