vcd_max_retry_timeout   = "50000"
vcd_catalog_name        = "Komus-MSP-DevStage-OST-Catalog" 
vcd_template_name       = "AlmaLinux-9-GenericCloud-BIOS-9.2-20230725.x86_64-working-init"

vcd_allow_unverified_ssl = false

############_NETWORK_##################
edge_gateway_name       = "Edge-176873"

dns   = ["10.160.192.5", "10.160.208.5"]

node =[
    {
        count  = 1
        name   = ["dev-dataline-binding-del-test"]
        memory = 2048
        cpus   = 2
        cpu_cores = 1
        local_hostname = ["dev-dataline-binding-del-test.dev.msp.komus.net"]
        networks = [ "dev-net-inf-ful-01a"]
        host      = ["10.160.242.73"]
        storage_profile = "SAS"
        override_size = "30720"
        disk = false
        size_in_mb = "10" #указано просто для значения. В инфраструктуру не пойдет. Необходимо чтобы шаблон отработал
        cloud-init-path = "cloud-init.yml"
    }
]

