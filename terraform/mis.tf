# MIS 環境定義
resource "proxmox_vm_qemu" "mis" {
  count       = 3
  name        = element(var.proxmox_mis_service_name, count.index)
  clone       = var.proxmox_vm_clone_name
  vmid        = var.proxmox_vm_id_base + 1 + count.index
  os_type     = "cloud-init"
  agent       = 1
  target_node = element(var.proxmox_hosts, count.index)
  cores       = var.proxmox_mis_cores
  sockets     = var.proxmox_mis_sockets
  memory      = var.proxmox_mis_memory

  disk {
    type    = "NFS"
    storage = "storage"
    size    = var.proxmox_mis_disk_size
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # ciuser     = "root"
  # cipassword = "P@ssw0rd@@"
  ipconfig0 = "dhcp"
}

