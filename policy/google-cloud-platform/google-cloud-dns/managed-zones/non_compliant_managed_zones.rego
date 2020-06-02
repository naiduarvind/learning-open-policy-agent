package google_cloud_dns.non_compliant_managed_zones

import data.google_cloud_dns

non_compliant_managed_zones[name] {
    resource := google_cloud_dns.managed_zones_changes[_]
    new_resource := resource.change.after

    "on" != new_resource.dnssec_config[_].state
    # "public" != new_resource.visibility

    name := resource.change.after.dns_name
}