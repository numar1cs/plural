metadata {
  name = "superset"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/superset"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "7e6964b8ed6535730e3a707f196660cd5c0d2ea53b361a9b846e1f82493704d2"
    retries = 0
    verbose = false
  }
}
