terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

variable "condition" {
  default = true
}

resource "null_resource" "sleep" {
triggers = {
time = timestamp ()
}
count = var.condition ? 1 : 3
  provisioner "local-exec" {
    command = <<EOT
    echo 'Hello World'
    sleep 30
    EOT
  }
}

#1231
