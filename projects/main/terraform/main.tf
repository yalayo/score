# provider config
terraform {
  cloud {
    organization = "rondon-sarnik"

    workspaces {
      name = "score-app"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}