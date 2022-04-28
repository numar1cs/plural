metadata {
  path = "airbyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vfcXLAdBs8bDNYjLHTYNPmxYWxjVDvTA5XTAvpUGC5c="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "airbyte/terraform"
  target  = "airbyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "airbyte",
  ]

  sha     = "h1:vfcXLAdBs8bDNYjLHTYNPmxYWxjVDvTA5XTAvpUGC5c="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "airbyte"
  target  = "airbyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "airbyte",
  ]

  sha     = "090a85300dc8b05ad371e75434eec74dcaf5ec5623f1d94e431a53a316c9e3b5"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "airbyte/helm"
  target  = "airbyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "airbyte",
  ]

  sha     = "h1:AK/uQ0YLZoZ+j/kcXeGMLWWbWfnrAz445woQHT25MIw="
  retries = 0
  verbose = false
}
