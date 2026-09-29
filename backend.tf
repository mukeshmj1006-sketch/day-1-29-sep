terraform {
  backend "s3" {
      bucket = "mukeshmj97578637465r8"
    key    = "day1/terraform.tfstate"
    region = "us-west-2"
}
}