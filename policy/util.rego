package terraform.util

resources(resource_type) = {rs[i] |
	some path, value
	walk(input.planned_values, [path, value])
	rs := tfplan_resources(path, value)
	rs[i].type == resource_type
}

tfplan_resources(path, value) = resources {
	reverse_index(path, 1) == "resources"
	reverse_index(path, 2) == "root_module"
	resources := value
}

tfplan_resources(path, value) = resources {
	reverse_index(path, 1) == "resources"
	reverse_index(path, 3) == "child_modules"
	resources := value
}

reverse_index(path, idx) = value {
	value := path[minus(count(path), idx)]
}
