variable "domain_name" {
}

variable "other_domains" {
  type = list(string)
  default = []
}

variable "region" {
  default = "eu-west-1"
}


variable "cert_arn" {

}

variable "bucket_policies" {
  type = list(object({
      sid = string
      type = string
      identifiers = list(string)
      actions = list(string)
      resources = list(string)
  }))

  default = []
}