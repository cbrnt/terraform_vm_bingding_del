terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "3.10.0"
    }
  }
  required_version = "<=1.5.5"
}
