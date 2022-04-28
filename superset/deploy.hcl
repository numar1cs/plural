metadata {
  path = "superset"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:PDnO2POBwfjOja++cKdk6+auMb/jHhgqR+YbEXFwyk4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:PDnO2POBwfjOja++cKdk6+auMb/jHhgqR+YbEXFwyk4="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "superset"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "3112f79555ad56c36a5351e75d9e8e85de5b195a533f4238e17894b3cc9866f0"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "superset"
  target  = "superset/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "superset",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "superset"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "superset",
  ]

  sha     = "h1:NmYrNmGoyQVBQbtf1gad892SKben/BCU91X1vewDzBg="
  retries = 1
  verbose = false
}
