terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.1"
    }
  }
}

provider "vsphere" {
  user                 = "cloudadmin@vmc.local"
  password             = "g+DOXyp08z!IZIn"
  vsphere_server       = "10.5.1.196"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "SDDC-Datacenter"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster-1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_datastore" "datastore" {
  name          = "WorkloadDatastore"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_network" "network" {
  name          = "CG-T1-SEG-30-20-10"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = "Ubuntu"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
