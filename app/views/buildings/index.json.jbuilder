json.array! @buildings do |b|
	json.array! [b.finished, b.roof_height || b.antenna_height || b.spire_height, b.building_name, b.city_name]
end
