# Custom class to sort get_property_list() array alphabetically
class_name _PropertySorterAlphabetical


static func sort_ascending(a, b):
	return a.name < b.name
