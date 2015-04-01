require 'pry'


building_id = [1, 2, 3]
building_name = ["WTC 1", "Nordstrom Tower", "Empire State Building"]
building_height = [1776, 1775, 1351]

i = 0
while i < building_id.length
	a = []
	h = Hash.new

	h["id"] = building_id[i]
	h["name"] = building_name[i]
	h["height"] = building_height[i]

	a.push(h)

	i += 1
end

buildings = building_id.map {|id, name|
{'id' => id, 'name' => }
}



# use the one below!
i = 0
	a = []
while i < building_id.length

	h = Hash.new
	a.push(h)

	h["id"] = building_id[i]
	h["name"] = building_name[i]
	h["height"] = building_height[i]


	i += 1
end


Pry.start(binding)