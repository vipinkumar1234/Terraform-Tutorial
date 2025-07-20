terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "ghp_1234567890yourdummyaccesstoken"  # Replace with your GitHub PAT
  owner = "your-github-username"               # Replace with your GitHub username
}

resource "github_repository" "practice_repo" {
  name        = "Testingformyownpractice"
  description = "Repository created using Terraform for practice"
  visibility  = "public"
  auto_init   = true
}
