require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'

building_id_aa = []
building_name_aa = []
city_name_aa = []
image_width_aa = []
image_height_aa = []
drawing_id_aa = []
drawing_date_added_aa = []
city_id_aa = []
state_id_aa = []
state_abbreviation_aa = []
country_id_aa = []
country_name_aa = []
illustrator_id_aa = []
illustrator_name_aa = []
state_id_aa = []
status_id_aa = []
status_aa = []
finished_aa = []
floors_aa = []
building_use_aa = []
antenna_height_aa = []
spire_height_aa = []
roof_height_aa = []

select_diagrams_h = {
	'201' => 'World Tallest Skyscrapers 2020',
	'202' => 'World Skyscrapper Construction 2015',
	'203' => 'World Ten Skyscraper Tallest 2015',
	'205' => 'World Talltest Skyscraper Title Holders',
	'206' => "World Tallest Towers",

	'67906779' => 'New York',
	'67908320' => 'Seattle'
	}

# scrapes the first page of each city search page
# input search page id's for selected diagrams into diagrams_id_a
# diagrams_id_a =	select_diagrams_h.keys
diagrams_id_a = ['67908320', '67906779']

diagrams_id_a.each do |n|

	city = HTTParty.get('http://skyscraperpage.com/diagrams/?searchID='+n)

	city_rdom = Nokogiri::HTML(city)

	city_med = city_rdom.css('.med')

	city_table = city_med[6]
	# Pry.start(binding)

	result = city_table.to_s.gsub("&amp;","and").split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['name']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(',')
	Pry.start(binding)


	building_name_aa.push(result)
	city_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['city']"}[0][1].gsub("[",'').gsub("]",'').split(',')) 
	# building_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['buildingID']"}[0][1].gsub("[",'').gsub("]",'').split(',')) 
	# image_width_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['width']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# image_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['height']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# drawing_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['drawingID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# drawing_date_added_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['timeAdded']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# city_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['cityID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# state_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['stateID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# state_abbreviation_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['state']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# country_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['countryID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# country_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['country']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# illustrator_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['memberID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# illustrator_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['illustrator']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# status_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['statusID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# status_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['status']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# finished_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['finished']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# floors_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['floors']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# building_use_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['buildingUse']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# antenna_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['antenna']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# spire_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['spire']"}[0][1].gsub("[",'').gsub("]",'').split(','))
	# roof_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['roof']"}[0][1].gsub("[",'').gsub("]",'').split(','))
end

building_name_a = building_name_aa.flatten
city_name_a = city_name_aa.flatten
# building_id_a = building_id_aa.flatten
# image_width_a = image_width_aa.flatten
# image_height_a = image_height_aa.flatten
# drawing_id_a = drawing_id_aa.flatten
# drawing_date_added_a = drawing_date_added_aa.flatten
# city_id_a = city_id_aa.flatten
# state_id_a = state_id_aa.flatten
# state_abbreviation_a = state_abbreviation_aa.flatten
# country_id_a = country_id_aa.flatten
# country_name_a = country_name_aa.flatten
# illustrator_id_a = illustrator_id_aa.flatten
# illustrator_name_a = illustrator_name_aa.flatten
# status_id_a = status_id_aa.flatten
# status_a = status_aa.flatten
# finished_a = finished_aa.flatten
# floors_a = floors_aa.flatten
# building_use_a = building_use_aa.flatten
# antenna_height_a = antenna_height_aa.flatten
# spire_height_a = spire_height_aa.flatten
# roof_height_a = roof_height_aa.flatten

# Pry.start(binding)

i = 0 
	buildings = []
while i < building_name_a.length
	h = Hash.new
	buildings.push(h)

	h["building_name"] = building_name_a[i]
	h["city_name"] = city_name_a[i]
	# h["building_id"] = building_id_a[i]
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


