terraform {
  required_version = ">= 1.0"
  required_providers {
    scalr = {
      source  = "scalr/scalr"
      version = "~> 1.0"
    }
  }
}

resource "scalr_workspace" "hello_bot_world_dev" {
  name           = "hello-bot-world-dev"
  environment_id = var.environment_id
  
  auto_apply            = true
  terraform_version     = "1.5.0"
  working_directory     = "terraform/environments/dev"
  
  vcs_repo {
    identifier = "rubensplentz/hello-bot-world"
    branch     = "main"
  }
  
  tags = {
    service     = "hello-bot-world"
    environment = "dev"
  }
}

variable "environment_id" {
  description = "Scalr environment ID"
  type        = string
}
