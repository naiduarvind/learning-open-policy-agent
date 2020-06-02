package fastly.non_compliant_service

import data.fastly

non_compliant_service[name] {
    resource := fastly.fastly_service_changes[_]
    new_resource := resource.change.after

    false != new_resource.force_destroy

    name := resource.change.after.name
}