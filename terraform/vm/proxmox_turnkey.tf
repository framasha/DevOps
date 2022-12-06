provider "proxmox" {
  # Configuration for the Proxmox provider
  # Replace the values with your own Proxmox API credentials
  username = "proxmox_username"
  password = "proxmox_password"
  url      = "https://proxmox_host:8006/api2/json"
}

resource "proxmox_vm" "turnkey_server" {
  # Configuration for the VM resource
  # Replace the values with your own VM settings
  vmid   = 100
  node   = "proxmox_node"
  name   = "turnkey_server"
  ostype = "l26"

  # Attach the TurnKey ISO image to the VM
  iso {
    file = "/path/to/turnkey.iso"
  }

  # Configure the network settings for the VM
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Configure the VM to use a static IP address
  ip_address {
    address = "192.168.1.100"
    netmask = "255.255.255.0"
    gateway = "192.168.1.1"
  }
}
