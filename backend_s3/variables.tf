variable "aws_region" {
  type        = string
  description = "Regiao AWS"

  validation {
    condition     = length(var.aws_region) > 2 && substr(var.aws_region, 0, 3) == "us-"
    error_message = "The aws_region must be a valid table name starting with \"tb_\"."
  }
}