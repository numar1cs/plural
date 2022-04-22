metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:HTCAAc7aVOIavpNKWjGsWHkCGmL8cBYApFmLTGpRCCY="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "bootstrap",
  ]

  sha     = "h1:HTCAAc7aVOIavpNKWjGsWHkCGmL8cBYApFmLTGpRCCY="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "bootstrap",
  ]

  sha     = "3b4a0c83072268ed689d3548b026c742dd248982999ffeb99a6f5ec96b2787ce"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:0Dxb2uSt3eJ1Bd/qdxX+7+uO4ZfRrP5QoiyDJo8K5HY="
  retries = 0
  verbose = false
}
