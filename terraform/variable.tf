# host 登入資訊
variable "proxmox_api_url" {
  type    = string
  default = "https://10.10.10.31:8006/api2/json"
}

variable "proxmox_api_user" {
  type    = string
  default = "root@pam"
}

variable "proxmox_api_pwd" {
  type    = string
  default = "P@ssw0rd@@"
}

variable "proxmox_hosts" {
  type    = list(string)
  default = ["pve01", "pve02", "pve03"]
}

variable "proxmox_mis_service_name" {
  type    = list(string)
  default = ["api", "mail", "gitlab"]
}

variable "proxmox_network_gw" {
  type    = string
  default = "10.10.10.254"
}

variable "proxmox_network_start_address" {
  type    = string
  default = "10.10.10."
}

variable "proxmox_network_ip_base" {
  type    = number
  default = 131
}

variable "proxmox_vm_clone_name" {
  type    = string
  default = "CentOS7-Cloud-init"
}

variable "proxmox_vm_id_base" {
  type    = number
  default = 1000
}

variable "proxmox_vm_count" {
  type    = number
  default = 1
}

variable "proxmox_mis_sockets" {
  type    = number
  default = 4
}

variable "proxmox_mis_cores" {
  type    = number
  default = 1
}

variable "proxmox_mis_memory" {
  type    = number
  default = 2048
}

variable "proxmox_mis_disk_size" {
  type    = string
  default = "20G"
}

