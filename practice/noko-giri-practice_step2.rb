require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'

n = 1

city_name_af = []
building_id_af = []
building_name_af = []

while n < 10

	m = n.to_s

	city = HTTParty.get('http://skyscraperpage.com/diagrams/?cityID='+m)

	city_rdom = Nokogiri::HTML(city)

	city_med = city_rdom.css('.med')

	city_table = city_med[6]

# maybe do an if statement whend city_med[6] is shitty
	building_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['name']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	building_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['buildingID']"}[0][1].gsub("[",'').gsub("]",'').split(',')) 
	city_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['city']"}[0][1].gsub("[",'').gsub("]",'').split(',')) 

	# image_width_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['width']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# image_height_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['height']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# drawing_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['drawingID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# drawing_date_added_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['timeAdded']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# city_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['cityID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# state_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['stateID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# state_abbreviation_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['state']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# country_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['countryID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# country_name_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['country']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# illustrator_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['memberID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# illustrator_name_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['illustrator']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# status_id_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['statusID']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# status_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['status']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# finished_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['finished']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# floors_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['floors']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# building_use_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['buildingUse']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# antenna_height_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['antenna']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# spire_height_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['spire']"}[0][1].gsub("[",'').gsub("]",'').split(',')
	# roof_height_a = city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['roof']"}[0][1].gsub("[",'').gsub("]",'').split(',')

	n += 1

end

city_name_a = city_name_aa.flatten
building_id_a = building_id_aa.flatten
building_name_a = building_name_aa.flatten

# Pry.start(binding)

i = 0 
	buildings = []
puts "there are #{building_id_a.length} objects to iterate over"
while i < building_id_a.length
	puts "iterating over object #{i + 1} of #{building_id_a.length}"
	h = Hash.new
	buildings.push(h)

	h["building_id"] = building_id_a[i]
	h["building_name"] = building_name_a[i]
	h["city_name"] = city_name_a[i]
	# h["image_width"] = image_height_a[i]
	# h["image_height"] = image_height_a[i]
	# h["drawing_id"] = drawing_id_a[i]
	# h["drawing_date_added"] = drawing_date_added_a[i]
	# h["city_id"] =  city_id_a[i]
	# h["state_id"] = state_id_a[i]
	# h["state_abbreviation"] = state_abbreviation_a[i]
	# h["country_id"] = country_id_a[i]
	# h["country_name"] = country_name_a[i]
	# h["illustrator_id"] = illustrator_id_a[i]
	# h["illustrator_name"] = illustrator_name_a[i]
	# h["status_id"] = status_id_a[i]
	# h["status"] = status_a[i]
	# h["finished"] = finished_a[i]
	# h["floors"] = floors_a[i]
	# h["building_use"] = building_use_a[i]
	# h["antenna_height"] = antenna_height_a[i]
	# h["spire_height"] = spire_height_a[i]
	# h["roof_height"] = roof_height_a[i]

	i += 1
end


Pry.start(binding)


