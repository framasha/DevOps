# Define the provider
provider "proxmox" {
  # Provide the URL for the Proxmox API endpoint
  api_url = var.proxmox_api_url

  # Provide authentication credentials
  username = var.proxmox_username
  password = var.proxmox_password
}

# Define the resource for creating a container
resource "proxmox_container" "ubuntu" {
  # Specify the type of container to create
  vmid = 100 # This value is an example and may need to be adjusted

  # Set the name of the container
  name = "ubuntu-container"

  # Set the node on which to create the container
  node = "proxmox-node"

  # Set the type of OS to install in the container
  ostype = "lxc"

  # Set the template to use for the container
  template = "ubuntu-18.04"

  # Set the IP address to assign to the container
  ip_address = "192.168.0.100"

  # Set the subnet mask to use for the container
  netmask = "255.255.255.0"

  # Set the gateway to use for the container
  gateway = "192.168.0.1"

  # Set the DNS server to use for the container
  nameserver = "8.8.8.8"
}
