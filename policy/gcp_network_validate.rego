package terraform.gcp.network

import data.terraform.util.resources
import data.terraform.util.tfplan_resources

allowed_region := ["asia-east1"]

rs := resources("google_compute_subnetwork")

# validate subnet located region.
deny[msg] {
	
    region := rs[name].values.region
	not valid_region(region, allowed_region)

	msg := sprintf("%v has an invalid region : %v", [
		rs[name].address,
		region,
	])
}

# validate vpc flow log enable
deny[msg] {
	
    rs[name].values.log_config == []

	msg := sprintf("%v not enable vpc flow log", [
		rs[name].address,
	])
}

# validate enable private google access
deny[msg] {
	
    rs[name].values.private_ip_google_access != true

	msg := sprintf("%v not enable private google access", [
		rs[name].address,
	])
}

valid_region(region, values) {
    region == values[_]
}
