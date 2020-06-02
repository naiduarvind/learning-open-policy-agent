package check_provider

import data.google_cloud_dns

check_provider[name] {
    resource := google_cloud_dns.record_sets[_]
    new_resource := google_cloud_dns.record_sets_changes[_]

    "google" != resource.provider_name

    name := new_resource.name
}