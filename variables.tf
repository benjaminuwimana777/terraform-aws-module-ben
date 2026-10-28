variable "vpc_config" {
  description = "Contains the VPC configuration. More specifically the required cidr_block and the vpc name."
  type = object({
    cidr_block = string
    name       = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The cidr block option must contain valid CIDR block"
  }
}

variable "subnet_config" {
  description = <<EOT
  Accepts a map of subnet configurations. Each configuration should contain:
  cidr_block: The cidr_block of the subnet
  public    : whether the subnet is public of private (defaults to false)
  az        : The availability zone where to deploy the subnet.
  EOT
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))

  validation {
    condition = alltrue(
      [for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))]
    )
    error_message = "The cidr block option must contain valid CIDR block"
  }
}
