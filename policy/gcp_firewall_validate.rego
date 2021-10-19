package terraform.gcp.firewall

import data.terraform.util.resources
import data.terraform.util.tfplan_resources

rs := resources("google_compute_firewall")

# validate firewall rule
deny[msg] {
	
    source_ranges := rs[name].values.source_ranges
    validate_fw_source_ranges(source_ranges, "0.0.0.0/0")

	msg := sprintf("%v has an invalid source ranges : %v", [
		rs[name].address,
		source_ranges,
	])
}

validate_fw_source_ranges(source_ranges, not_allowed_fw) {
    source_ranges[_] == not_allowed_fw
}