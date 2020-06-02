package check_project_name

import data.google_cloud_dns

check_project_name[name] {
    new_resource := google_cloud_dns.record_sets_changes[_]

    "mv-auxiliary" != new_resource.project

    name := new_resource.name
}