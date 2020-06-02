package fastly

import data.terraform

fastly_service_changes[r] {
	resource := terraform.resource_changes[_]
    resource.type = "fastly_service_v1"
    r := resource
}