variable "tags" {
  default = {
    Environment   = "adl-sandbox"
    Orchestration = "terraform"
  }

  description = "Map of default tags for resources"
}

variable "logging_account_id" {
  default     = "046638704834"
  description = "ID of logging account (single account per bank)"
}

variable "root_account_id" {
  default     = "406357340800"
  description = "ID of root account"
}

variable "domain_controller_ip" {
  default     = "172.31.28.134"
  description = "DC controller ip address"
}

variable "region" {
  default     = "us-east-2"
  description = "Default region"
}

# VPN configuration
variable "vpn_bgp_asn" {
  default     = "65000"
  description = "BGP private ASN. Must be unique for account"
}

variable "vpn_networks" {
  # default     = ["192.168.20.0/24"]
  default     = ["192.168.20.0/24", "10.130.1.74/32"]
  description = "List of customer network CIDRs"
}

variable "vpn_public_ip" {
  default     = "190.144.253.30"
  description = "Public IP-address for VPN-connection on customer side"
}

variable "on_premise_cidr" {
  default     = "0.0.0.0/0"
  description = "Bank CIDR for on-premise hosts"
}

variable "cidr" {
  default     = "10.149.8.0/21"
  description = "Default CIDR for VPC"
}

variable "azs" {
  default     = ["us-east-2a", "us-east-2b"]
  description = "Availability zones"
}

variable "subnets" {
  default = {
    private = ["10.149.10.0/24", "10.149.11.0/24"]
    public  = ["10.149.8.0/24", "10.149.9.0/24"]
  }

  description = "Subnets in defautl CIDR for services"
}

variable "efs_src" {
  # We don't want to backup dev-in-stage environment
  default = "stg-efs-openvpn stg-efs-grafana stg-efs-ecs-common"

  description = "Pattern for source EFS discovering"
}

variable "volume_type" {
  default = {
    mariadb    = "gp2"
    es_default = "gp2"
    es_infra   = "gp2"
  }
}

variable "volume_size" {
  default = {
    mariadb    = 20
    es_default = 35
    es_infra   = 35
  }
}

variable "multi_az" {
  default = {
    redis      = false
    mariadb    = false
    es_default = false
    es_infra   = false
  }

  description = "Whether multi AZ is enabled"
}

variable "instance_type" {
  default = {
    redis      = "cache.t2.micro"
    mariadb    = "db.t3.micro"
    es_default = "t2.medium.elasticsearch"
    es_infra   = "t2.medium.elasticsearch"
    logstash   = "t3.small"
    grafana    = "t3.small"
    openvpn    = "t3.micro"
    nginx_bind = "t3.micro"
    xray       = "t3.micro"
  }

  description = "Type of instances for service"
}

variable "instance_count" {
  default = {
    redis      = 1
    mariadb    = 1
    es_default = 1
    es_infra   = 1
    logstash   = 1
  }

  description = "Number of instances for service"
}

variable "engine_version" {
  default = {
    redis      = "3.2.10"
    mariadb    = "10.1.31"
    es_default = "5.3"
    es_infra   = "5.3"
  }

  description = "Desired engine version od service in AWS (redis, mariadb, etc.)"
}

locals {
  env_name    = "${var.tags["Environment"]}"
  zone_name   = "${local.env_name}.internal-aws.avaldigitallabs.com."
  bank        = "${element(split("-", var.tags["Environment"]), 0)}"
  environment = "${element(split("-", var.tags["Environment"]), 1)}"
}

# TODO: HardCode
variable "OpenVpnIp" {
  default = "18.224.153.240"
}

# TODO: HardCode
variable "NatEipA" {
  default = "18.224.159.64"
}
