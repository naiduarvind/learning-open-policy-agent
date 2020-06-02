package main

import data.google_cloud_dns.non_compliant_managed_zones.non_compliant_managed_zones


deny[msg] {
	count(non_compliant_managed_zones) > 0
	msg := sprintf("Cloud DNS managed zone %s is not configured to be compliant!", [non_compliant_managed_zones[_]])
}

allow {
	count(deny) == 0
}