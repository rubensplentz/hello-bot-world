terraform {
  required_version = ">= 1.0"
  required_providers {
    scalr = {
      source  = "scalr/scalr"
      version = "~> 1.0"
    }
  }
}

resource "scalr_workspace" "hello_bot_world_prod" {
  name           = "hello-bot-world-prod"
  environment_id = var.environment_id
  
  auto_apply            = false
  terraform_version     = "1.5.0"
  working_directory     = "terraform/environments/prod"
  
  vcs_repo {
    identifier = "rubensplentz/hello-bot-world"
    branch     = "main"
  }
  
  tags = {
    service     = "hello-bot-world"
    environment = "prod"
  }
}

variable "environment_id" {
  description = "Scalr environment ID"
  type        = string
}
