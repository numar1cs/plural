metadata {
  path = "superset"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:PDnO2POBwfjOja++cKdk6+auMb/jHhgqR+YbEXFwyk4="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "superset",
  ]

  sha     = "h1:PDnO2POBwfjOja++cKdk6+auMb/jHhgqR+YbEXFwyk4="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "superset"
  target  = "superset/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "superset",
  ]

  sha     = "3112f79555ad56c36a5351e75d9e8e85de5b195a533f4238e17894b3cc9866f0"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "superset/helm"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "superset",
  ]

  sha     = "h1:NmYrNmGoyQVBQbtf1gad892SKben/BCU91X1vewDzBg="
  retries = 0
  verbose = false
}
