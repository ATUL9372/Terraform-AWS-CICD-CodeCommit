terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}


provider aws {
  region     = "${var.region}"            // Enter AWS region name
  access_key = "${var.access_keys}"      // Enter Your Access Key ID
  secret_key = "${var.secret_keys}"      // Enter Your Secret Key
}
