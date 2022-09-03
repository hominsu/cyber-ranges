variable "REPO" {
  default = "hominsu"
}

variable "AUTHOR_NAME" {
  default = "hominsu"
}

variable "AUTHOR_EMAIL" {
  default = "hominsu@foxmail.com"
}

variable "VERSION" {
  default = "latest"
}

group "default" {
  targets = [
    "sqli-labs",
  ]
}

target "sqli-labs" {
  context    = "."
  dockerfile = "Dockerfile"
  args       = {
    AUTHOR_NAME  = "${AUTHOR_NAME}"
    AUTHOR_EMAIL = "${AUTHOR_EMAIL}"
  }
  tags = [
    notequal("", VERSION) ? "${REPO}/sqli-labs:${VERSION}" : "",
    "${REPO}/sqli-labs:latest",
  ]
  platforms = ["linux/amd64"]
}
