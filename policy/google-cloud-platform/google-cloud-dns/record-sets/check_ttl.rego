package check_ttl

import data.google_cloud_dns
import data.records_validation

allowed_record_ttl = {"A": [600], "CNAME": [600], "MX": [3600], "TXT": [600]}

check_ttl[name] {
    new_resource := google_cloud_dns.record_sets_changes[_]

    ttl := new_resource.ttl
    not records_validation.contains(allowed_record_ttl[new_resource.type], ttl)

    name := new_resource.name
}