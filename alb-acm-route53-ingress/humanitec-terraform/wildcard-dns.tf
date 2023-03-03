variable "dns_resource_name" {}
variable "dns_domain" {}

resource "humanitec_resource_definition" "dns" {
  id          = var.dns_resource_name
  name        = var.dns_resource_name
  type        = "dns"
  driver_type = "humanitec/dns-wildcard"

  driver_inputs = {
    values = {
      "domain" : var.dns_domain,
      "template" : "$${context.app.id}-$${context.env.id}"
    }
    secrets = {
    }
  }

  criteria = [
    {
      app_id = humanitec_application.app.id
    }
  ]
}
