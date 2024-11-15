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
      version = "~> 4.45.0"
    }
  }
}

variable "cloudflare_api_token" {
  default = ""
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_workers_script" "score_backend" {
  account_id = "f037e56e89293a057740de681ac9abbe"
  name       = "score-backend"
  content    = file("server.js")
}