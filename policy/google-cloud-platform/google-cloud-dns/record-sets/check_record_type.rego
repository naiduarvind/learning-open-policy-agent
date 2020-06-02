package check_record_type

import data.google_cloud_dns
import data.records_validation

allowed_record_types = ["A", "CNAME", "MX", "TXT"]

check_record_type[name] {
    new_resource := google_cloud_dns.record_sets_changes[_]

    not records_validation.contains(allowed_record_types, new_resource.type)

    name := new_resource.name
}