package terraform.gcp.instance

import data.terraform.util.resources
import data.terraform.util.tfplan_resources

allowed_machine_type := [
	"e2-medium",
	"e2-micro",
]

allowed_image := ["rhel-cloud/rhel-7"]

rs := resources("google_compute_instance")

# validate machine type.
deny[msg] {
	
	# rs := resources("google_compute_instance")
	machine_type := rs[name].values.machine_type

    not valid_machine_type(machine_type, allowed_machine_type)

	msg := sprintf("%v has an invalid machine type : %v", [
		rs[name].address,
		machine_type,
	])
}

# validate instance image
deny[msg] {
	
	# rs := resources("google_compute_instance")
	image := rs[name].values.boot_disk[_].initialize_params[_].image

    not valid_image(image, allowed_image)

	msg := sprintf("%v has an invalid machine type : %v", [
		rs[name].address,
		image,
	])
}

valid_machine_type(machine_type, values) {
    machine_type == values[_]
}

valid_image(image, values) {
    image == values[_]
}