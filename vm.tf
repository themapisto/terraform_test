resource "vsphere_virtual_machine" "vm" {
  name             = "koo-ubuntu"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  guest_id         = "ubuntu64Guest"
  memory           = 2048
  firmware = "efi"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "disk"
    size  = 50
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "hello-world"
        domain    = "vmwarevmc.com"
      }
      network_interface {
        ipv4_address = "30.20.10.166"
        ipv4_netmask = 24
      }
      ipv4_gateway = "30.20.10.1"
    }
  }
}