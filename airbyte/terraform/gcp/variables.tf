variable "namespace" {
  type = string
  default = "airbyte"
}

variable "airbyte_bucket" {
  type = string
}


variable "gcp_region" {
  type = string
  default = "us-east1"
  description = <<EOF
The region you wish to deploy to
EOF
}

variable "bucket_location" {
  type = string
  default = "US"
  description = "the location of the bucket"
}

variable "project_id" {
  type = string
  description = <<EOF
The ID of the project in which the resources belong.
EOF
}

variable "cluster_name" {
  type = string
  default = "plural"
}