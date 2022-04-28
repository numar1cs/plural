metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:fV0uR2S/0wmUUJ91p0hngL5WxHfj1mEfLY6Dx/kvcZk="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:fV0uR2S/0wmUUJ91p0hngL5WxHfj1mEfLY6Dx/kvcZk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "6e7d03862117593501e82d2accf83e6bc857a150e2bf028aabdc4247fcb8c1da"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:+U4eEwc1tqOG8siafhh7uGp55YYFdMfcemcdbUU3Z/0="
  retries = 0
  verbose = false
}
