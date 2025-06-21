resource "local_file" "youtube" {
  content = "supersecretpassword"
  filename = "password.txt"
}

variable "password" {
  default = "supersecretpassword"
  sensitive = true
}

resource "local_sensitive_file" "youtube" {
  content = "supersecretpassword"
  filename = "password.txt"
}

