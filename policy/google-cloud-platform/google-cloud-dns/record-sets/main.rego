package main

import data.check_project_name.check_project_name as cpn
import data.check_provider.check_provider as cp
import data.check_module_naming_convention as cmnc
import data.check_record_type.check_record_type as crt
import data.check_rrdatas_validation.check_rrdatas_validation as crv
import data.check_ttl.check_ttl as ct

deny[reason] {
	count(cpn) > 0
	reason := sprintf(
		"Project name for record set %s should be mv-auxiliary!",
		[cpn[_]]
	)
}

deny[reason] {
	count(cp) > 0
	reason := sprintf(
		"Provider for record set %s should be google!",
		[cp[_]]
	)
}

deny[reason] {
	count(cmnc.check_managed_zone_convention) > 0
	reason := sprintf(
		"Naming convention for record set %s should include managed zone prefix with an underscore (e.g. <mindvalley_com>-a-links-ru)!",
		[cmnc.check_managed_zone_convention[_]]
	)
}

deny[reason] {
	count(cmnc.check_record_name_convention) > 0
	reason := sprintf(
		"Naming convention for record set %s should include record name postfix (e.g. mindvalley_com-a-<links-ru>)!",
		[cmnc.check_record_name_convention[_]]
	)
}

deny[reason] {
	count(cmnc.check_record_type_convention) > 0
	reason := sprintf(
		"Naming convention for record set %s should include record type as infix (e.g. mindvalley_com-<a>-links-ru)!",
		[cmnc.check_record_type_convention[_]]
	)
}

deny[reason] {
	count(crt) > 0
	reason := sprintf(
		"Record type for record set %s should be either A, CNAME, MX, or TXT!",
		[crt[_]]
	)
}

deny[reason] {
	count(crv) > 0
	reason := sprintf(
		"Value for record set %s should conform to IP address notation (e.g. 255.255.255.255).",
		[crv[_]]
	)
}

deny[reason] {
	count(ct) > 0
	reason := sprintf(
		"TTL for record set %s should be 3600ms for MX records and 600ms for other types!",
		[ct[_]]
	)
}