terraform {
  backend "s3" {
      bucket = "mukeshmj3896353r"
    key    = "day1/terraform.tfstate"
    region = "us-west-2"
    use_lockfile = true
}
}