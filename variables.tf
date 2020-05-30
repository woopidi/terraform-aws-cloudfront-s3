variable "domain_name" {
}

variable "other_domains" {
  type = list(string)
}

variable "region" {
  default = "eu-west-1"
}


variable "cert_arn" {

}
