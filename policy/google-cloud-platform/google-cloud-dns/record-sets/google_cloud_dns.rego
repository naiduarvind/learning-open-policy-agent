package google_cloud_dns

import data.terraform

record_sets[resources] {
    resource := terraform.resource_changes[_]

    resource.type = "google_dns_record_set"

    resources := resource
}

record_sets_changes[new_resources] {
    resource := terraform.resource_changes[_]

    resource.type = "google_dns_record_set"
    
    new_resources := terraform.resource_changes[_].change.after
}