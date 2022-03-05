terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://sfo3.digitaloceanspaces.com"
    region                      = "us-east-1"         // needed
    bucket                      = "nxcore-terraform"  // name of your space
    key                         = "infrastructure/nxcore-portainer.tfstate"
  }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "digitalocean" {
  token     = "${var.do_token}"
}

provider "cloudflare" {
  api_token = "${var.cloudflare_api_token}"
}