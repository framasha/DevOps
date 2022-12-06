provider "proxmox" {
  # Replace with your Proxmox hostname or IP address
  host     = "proxmox.example.com"
  password = "mysecretpassword"
  username = "root"
}

resource "proxmox_vm" "ubuntu" {
  # Replace with the ID of the Proxmox cluster where the VM will be deployed
  cluster_id = "pve"

  # Replace with the ID of the Proxmox storage where the VM disk will be stored
  storage_id = "local-lvm"

  # Replace with the ID of the Proxmox node where the VM will be deployed
  node_id = "proxmox"

  # Replace with the ID of the Proxmox template to use for the VM
  template_id = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"

  # Replace with the desired name and description for the VM
  name        = "Ubuntu Server"
  description = "Ubuntu 20.04 LTS Server"

  # Replace with the desired CPU, memory, and disk settings for the VM
  cpu         = 1
  memory      = 2048
  disk        = 8192

  # Set a static IP address for the VM
  network {
    bridge = "vmbr0"
    ip     = "192.168.1.100/24"
  }
}
