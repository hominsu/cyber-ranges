variable "REPO" {
  default = "hominsu"
}

variable "AUTHOR_NAME" {
  default = "hominsu"
}

variable "AUTHOR_EMAIL" {
  default = "hominsu@foxmail.com"
}

variable "RUNTIME_NATIVE_VERSION" {}

variable "RUNTIME_MYSQL_VERSION" {}

variable "RUNTIME_TARBALL_VERSION" {}

variable "CYBER_RANGES_VERSION" {}

variable "PIKACHU_VERSION" {}

variable "SQLI_LABS_VERSION" {}

variable "XSS_LABS_VERSION" {}

variable "UPLOAD_LABS_VERSION" {}

variable "ranges" {
  default = [
    "pikachu",
    "sqli-labs",
    "upload-labs",
    "xss-labs",
  ]
}

variable "runtime" {
  default = [
    "runtime-mysql",
    "runtime-native",
    "runtime-tarball",
  ]
}

group "default" {
  targets = ranges
}

group "all" {
  targets = concat(runtime, ranges)
}

target "runtime-native" {
  context  = "app/runtime/"
  contexts = {
    "utils" = "utils"
  }
  dockerfile = "native.dockerfile"
  args       = {
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", RUNTIME_NATIVE_VERSION) ? "${REPO}/cyber-ranges:runtime-native-${RUNTIME_NATIVE_VERSION}" : "",
    "${REPO}/cyber-ranges:runtime-native",
  ]
  platforms = ["linux/amd64"]
}

target "runtime-mysql" {
  context  = "app/runtime/"
  contexts = {
    "utils" = "utils"
  }
  dockerfile = "mysql.dockerfile"
  args       = {
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", RUNTIME_MYSQL_VERSION) ? "${REPO}/cyber-ranges:runtime-mysql-${RUNTIME_MYSQL_VERSION}" : "",
    "${REPO}/cyber-ranges:runtime-mysql",
  ]
  platforms = ["linux/amd64"]
}

target "runtime-tarball" {
  context    = "app/runtime/"
  dockerfile = "tarball.dockerfile"
  args       = {
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", RUNTIME_TARBALL_VERSION) ? "${REPO}/cyber-ranges:runtime-tarball-${RUNTIME_TARBALL_VERSION}" : "",
    "${REPO}/cyber-ranges:runtime-tarball",
  ]
  platforms = ["linux/amd64"]
}

target "cyber-ranges" {
  context    = "app/cyber-ranges/"
  dockerfile = "Dockerfile"
  args       = {
    REPO         = REPO
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", CYBER_RANGES_VERSION) ? "${REPO}/cyber-ranges:${CYBER_RANGES_VERSION}" : "",
    "${REPO}/cyber-ranges:latest",
  ]
  platforms = ["linux/amd64"]
}

target "pikachu" {
  context    = "app/pikachu/"
  dockerfile = "Dockerfile"
  args       = {
    REPO         = REPO
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", PIKACHU_VERSION) ? "${REPO}/pikachu:${PIKACHU_VERSION}" : "",
    "${REPO}/pikachu:latest",
  ]
  platforms = ["linux/amd64"]
}

target "sqli-labs" {
  context    = "app/sqli-labs/"
  dockerfile = "Dockerfile"
  args       = {
    REPO         = REPO
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", SQLI_LABS_VERSION) ? "${REPO}/sqli-labs:${SQLI_LABS_VERSION}" : "",
    "${REPO}/sqli-labs:latest",
  ]
  platforms = ["linux/amd64"]
}

target "upload-labs" {
  context    = "app/upload-labs/"
  dockerfile = "Dockerfile"
  args       = {
    REPO         = REPO
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", UPLOAD_LABS_VERSION) ? "${REPO}/upload-labs:${UPLOAD_LABS_VERSION}" : "",
    "${REPO}/upload-labs:latest",
  ]
  platforms = ["linux/amd64"]
}

target "xss-labs" {
  context    = "app/xss-labs/"
  dockerfile = "Dockerfile"
  args       = {
    REPO         = REPO
    AUTHOR_NAME  = AUTHOR_NAME
    AUTHOR_EMAIL = AUTHOR_EMAIL
  }
  tags = [
    notequal("", XSS_LABS_VERSION) ? "${REPO}/xss-labs:${XSS_LABS_VERSION}" : "",
    "${REPO}/xss-labs:latest",
  ]
  platforms = ["linux/amd64"]
}