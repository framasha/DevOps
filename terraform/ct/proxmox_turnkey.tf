provider "proxmox" {
  # Configuration for the Proxmox provider
  # Replace the values with your own Proxmox API credentials
  username = "proxmox_username"
  password = "proxmox_password"
  url      = "https://proxmox_host:8006/api2/json"
}

resource "proxmox_lxc" "turnkey_container" {
  # Configuration for the LXC container resource
  # Replace the values with your own container settings
  vmid   = 100
  node   = "proxmox_node"
  pool   = "lxc"
  ostype = "debian"

  # Configure the network settings for the container
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Configure the container to use a static IP address
  ip_address {
    address = "192.168.1.100"
    netmask = "255.255.255.0"
    gateway = "192.168.1.1"
  }
}
