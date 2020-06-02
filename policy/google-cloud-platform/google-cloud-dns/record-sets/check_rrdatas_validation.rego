package check_rrdatas_validation

import data.google_cloud_dns

eval_ip_notation(arr) {
    ip_addresses := {ip_address | ip_address = is_following_notation(arr[i])}
}

is_following_notation(string) {
    re_match(`^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$`, string)
}

check_rrdatas_validation[name] {
    new_resource :=  google_cloud_dns.record_sets_changes[_]

    "A" == new_resource.type
    eval_ip_notation(new_resource.rrdatas) 

    name := new_resource.name
}