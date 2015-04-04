json.array! @buildings do |b|
	json.array! [b.finished, b.roof_height, b.building_name, b.city_name, b.building_id]
end
