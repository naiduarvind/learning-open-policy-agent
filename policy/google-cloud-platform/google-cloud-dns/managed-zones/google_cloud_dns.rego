package google_cloud_dns

import data.terraform

managed_zones_changes[r] {
    resource := terraform.resource_changes[_]
    resource.type = "google_dns_managed_zone"
    r := resource
}