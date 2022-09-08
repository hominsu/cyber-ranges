variable "REPO" {
  default = "hominsu"
}

variable "AUTHOR_NAME" {
  default = "hominsu"
}

variable "AUTHOR_EMAIL" {
  default = "hominsu@foxmail.com"
}

variable "RUNTIME_VERSION" {}

variable "PIKACHU_VERSION" {}

variable "SQLI_LABS_VERSION" {}

variable "ranges" {
  default = [
    "pikachu",
    "sqli-labs",
  ]
}

variable "runtime" {
  default = ["runtime"]
}

group "default" {
  targets = ranges
}

group "all" {
  targets = "${concat(runtime, ranges)}"
}

target "runtime" {
  context    = "app/runtime/"
  dockerfile = "Dockerfile"
  args       = {
    AUTHOR_NAME  = "${AUTHOR_NAME}"
    AUTHOR_EMAIL = "${AUTHOR_EMAIL}"
  }
  tags = [
    notequal("", RUNTIME_VERSION) ? "${REPO}/pikachu:runtime-${RUNTIME_VERSION}" : "",
    "${REPO}/cyber-ranges:runtime",
  ]
  platforms = ["linux/arm64", "linux/arm", "linux/amd64", "linux/386"]
}

target "pikachu" {
  context  = "app/pikachu/"
  contexts = {
    "hominsu/cyber-ranges:runtime" = "target:runtime"
  }
  dockerfile = "Dockerfile"
  args       = {
    REPO         = "${REPO}"
    AUTHOR_NAME  = "${AUTHOR_NAME}"
    AUTHOR_EMAIL = "${AUTHOR_EMAIL}"
  }
  tags = [
    notequal("", PIKACHU_VERSION) ? "${REPO}/pikachu:${PIKACHU_VERSION}" : "",
    "${REPO}/pikachu:latest",
  ]
  platforms = ["linux/arm64", "linux/arm", "linux/amd64", "linux/386"]
}

target "sqli-labs" {
  context  = "app/sqli-labs/"
  contexts = {
    "hominsu/cyber-ranges:runtime" = "target:runtime"
  }
  dockerfile = "Dockerfile"
  args       = {
    REPO         = "${REPO}"
    AUTHOR_NAME  = "${AUTHOR_NAME}"
    AUTHOR_EMAIL = "${AUTHOR_EMAIL}"
  }
  tags = [
    notequal("", SQLI_LABS_VERSION) ? "${REPO}/sqli-labs:${SQLI_LABS_VERSION}" : "",
    "${REPO}/sqli-labs:latest",
  ]
  platforms = ["linux/arm64", "linux/arm", "linux/amd64", "linux/386"]
}