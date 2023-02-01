# Home_Lab
Home Lab

[Home lab](https://wiggly-echo-ef6.notion.site/Home-lab-ebbd05a6288b4a38927dac5b249e958a)

### 架構圖

https://www.figma.com/file/b9OOL6nuSLOMMVZifPaRHA/Home-Lab-2023?node-id=1%3A2&t=RiI0bsydTxMweAcz-0

## 網路設備

- 中華電信小烏龜 預計升速 300/100
- UDM Pro
- USW 24 Port POE
- U6 Pro

## VPN

- 由 UDM Pro 提供兩種VPN連線方式
    - Teleport  Vlan tage 30
    - VPN L2TP Vlan tage 50

## 網段

Home Vlan tage 20

LAB Vlan tage 10

IoT Vlan tage 40

## 伺服器

- HP DL380 Gen9
- HP DL360 Gen9
- PC * 1
    - Intel I7 10700K
    - 64G
    - 1T SSD
    - RTX 3090

## Storage

- Synology NAS 30T (RAID5) 使用 NFS 為proxmox cluster 提供共用儲存空間
- TrueNAS → 肚子為 Synology NAS 30T 主要為提供更彈性的資料分享方式

## VM Host

- Proxmox Cluster (3 node)


## Cloud-init:

- Template VM → CentOS7 Mini 2009 預先安裝以及設定
    - yum update
    - install Proxmox client agent
    - 時區設定 +8 Taipei
    - 拒絕遠端SSH連線
    - 預先加入 筆電ssh

- 提供可設定部分
    - User
    - Password
    - DNS Domain
    - DNS Servers
    - SSH Key
    - IP 設定

## Packer

- ISO / Image 管理


## Terraform

- 使用Terraform 建置建置部署Home_LAB MIS 服務之虛擬機
- Create VM
    - Old VM For Docker
        - freeipa
        - Postfix
        - Nginx
        - HackMD
        - Gitlab
        - Gitrunner
        - Zabbix
        - Grafana
        - Owncloud
        - OCSNG
        - Zookeeper
        - Hook
        - jenkins
        - rabbitMQ
        - django
    - new vm K8S VM Master
    - new vm K8S VM Node-1
    - new vm K8S VM Node-2

## Docker Compose Service - Old VM

- [ ]  FreeIPA
- [ ]  Postfix
- [ ]  Nginx → CerBot, reverse proxy
- [ ]  HackMD
- [ ]  Gitlab
- [ ]  Zabbix
- [ ]  Grafana
- [ ]  OwnColud
- [ ]  OCSNG
- [ ]  ZooKeeper
- [ ]  Hook
- [ ]  jenkins
- [ ]  rabbitMQ


## Ansible

- Host/VM Host 軟體管控/安裝軟體以及服務
- 建置K8S * 3 service

# Docker compose

舊容器化之 doxker-compose.yml

## K8S

將容器化服務 轉為 K8S 由K8S管控容器