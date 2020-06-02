package main

import data.fastly.non_compliant_service.non_compliant_service

deny[msg] {
	count(non_compliant_service) > 0
	msg := sprintf("Fastly service %s is not configured to be compliant!", [non_compliant_service[_]])
}

allow {
	count(deny) == 0
}