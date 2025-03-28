#this is a test

terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
    }
  }
}

provider "fortios" {
  hostname     = "18.202.66.78:8443"
  token        = var.api_token
  insecure     = "true"
}

variable "api_token" {
  description = "API token for authentication"
  type        = string
  sensitive   = true
}

resource "fortios_system_dns" "trname" {
  cache_notfound_responses = "disable"
  dns_cache_limit          = 5000
  dns_cache_ttl            = 1800
  ip6_primary              = "::"
  ip6_secondary            = "::"
  primary                  = "8.8.8.8"
  retry                    = 2
  secondary                = "8.8.4.4"
  source_ip                = "0.0.0.0"
  timeout                  = 5
}