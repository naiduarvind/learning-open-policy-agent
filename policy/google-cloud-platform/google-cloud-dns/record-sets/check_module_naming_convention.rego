package check_module_naming_convention

import data.google_cloud_dns

resource := google_cloud_dns.record_sets[_]
new_resource := google_cloud_dns.record_sets_changes[_]
module_address_parts = split(resource.module_address, ".")
module_name_parts := module_address_parts[1]
managed_zone_name_parts = split(module_name_parts, "-")

check_managed_zone_convention[name] {
    managed_zone_name = managed_zone_name_parts[0]

    not contains(managed_zone_name, new_resource.managed_zone)

    name := new_resource.name
}

check_record_name_convention[name]{
    record_name_parts = split(new_resource.name, ".")
    record_name := record_name_parts[0]
    record_set_name = managed_zone_name_parts[2]

    not contains(record_set_name, record_name)

    name := new_resource.name
}

check_record_type_convention[name]{
    record_type = managed_zone_name_parts[1]
    uppercase_record_type := upper(record_type)

    new_resource.type != uppercase_record_type

    name := new_resource.name
}