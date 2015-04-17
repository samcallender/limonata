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

# building addresses found in second nokogiri scrape
building_address_a = []

select_diagrams_h = {
	# global diagrams
	# '201' => 'World Tallest Skyscrapers 2020',
	# '202' => 'World Skyscrapper Construction 2015',
	# '203' => 'World Ten Skyscraper Tallest 2015',
	# '205' => 'World Talltest Skyscraper Title Holders',
	# '206' => "World Tallest By Spire",
	# # INTERNATIONAL CITY
	# '67919160' => 'Toronto',
	# '67929489' => 'Hong Kong',
	# '67929711' => 'Shanghai',
	# '67929510' => 'London',
	# '67929519' => 'Mexico City',
	# '67929533' => 'Tokyo',
	# '67929543' => 'Jakarta',
	# '67929564' => 'Seoul',
	# '67929569' => 'Buenos Aires',
	# '67929586' => 'Sao Paulo',
	# '67929601' => 'Moscow',
	# '67929620' => 'Sydney',
	# '67929630' => 'Kuala Lumpur',
	# '67929646' => 'Frankfurt',
	# '67929680' => 'Madrid',
	# '67929686' => 'Tel Aviv',
	# '67929695' => 'Mumbai',
	# # US city diagrams
	# '67919362' => 'Los Angeles',
	# '67919387' => 'Chicago',
	# '67919405' => 'Dallas',
	# '67919428' => 'Houston',
	# '67919438' => 'Philadelphia',
	# '67919674' => 'Miami',
	# '67919314' => 'Atlanta',
	# '67919665' => 'Boston',
	# '67919769' => 'San Francisco',
	# '67919774' => 'Austin',
	# '67919787' => 'Portland',
	# '67919799' => 'San Diego',
	# '67919807' => 'Pittsburgh',
	# '67919816' => 'Denver',
	# '67919819' => 'Minneapolis',
	# '67919825' => 'Detroit',
	# '67919832' => 'Tampa',
	# '67919841' => 'Baltimore',
	# '67919848' => 'Salt Lake City',
	# '67919730' => 'Memphis',
	# '67919701' => 'Nashville',
	# '67919933' => 'Washington DC',
	# '67919682' => 'New Orleans',
	# '67908320' => 'Seattle',
	'67906779' => 'New York'
	# nyc timeline:
	# '67920028' => 'nyc timeline'
	}

# scrapes the first page of each city search page
# input search page id's for selected diagrams into diagrams_id_a
diagrams_id_a =	select_diagrams_h.keys
# diagrams_id_a = ['67908320']

# use p for how mamy pages deep you want to go for each city (25 buildings per page)
p = 1
while p < 5
	diagrams_id_a.each do |n|

		ps = p.to_s

		city = HTTParty.get('http://skyscraperpage.com/diagrams/?searchID='+n+'&page='+ps)

		city_rdom = Nokogiri::HTML(city)

		city_med = city_rdom.css('.med')

		city_table = city_med[6]
		

		# Note final gsub to remove ' strings in resulting arrays

		building_name_aa.push(city_table.to_s.gsub("&amp;","and").split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['name']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		# calling out this array because issues related to &amp;
		# in the building name.  There is additional gsub in the begining
		# to remove &amp;

		building_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['building']['buildingID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(',')) 
		city_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['city']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(',')) 
		image_width_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['width']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		image_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['height']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		drawing_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['drawingID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		drawing_date_added_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['timeAdded']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		city_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['cityID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		state_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['stateID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		state_abbreviation_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['city']['state']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		country_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['countryID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		country_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['country']['country']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		illustrator_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['memberID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		illustrator_name_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['illustrator']['illustrator']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		status_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['statusID']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		status_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['status']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		finished_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['finished']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		floors_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['floors']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		building_use_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['buildingUse']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		antenna_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['antenna']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		spire_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['spire']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
		roof_height_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['roof']"}[0][1].gsub("[",'').gsub("]",'').gsub("'", "").split(','))
	end
	p += 1
end

city_name_a = city_name_aa.flatten
building_id_a = building_id_aa.flatten
building_name_a = building_name_aa.flatten
image_width_a = image_width_aa.flatten
image_height_a = image_height_aa.flatten
drawing_id_a = drawing_id_aa.flatten
drawing_date_added_a = drawing_date_added_aa.flatten
city_id_a = city_id_aa.flatten
state_id_a = state_id_aa.flatten
state_abbreviation_a = state_abbreviation_aa.flatten
country_id_a = country_id_aa.flatten
country_name_a = country_name_aa.flatten
illustrator_id_a = illustrator_id_aa.flatten
illustrator_name_a = illustrator_name_aa.flatten
status_id_a = status_id_aa.flatten
status_a = status_aa.flatten
finished_a = finished_aa.flatten
floors_a = floors_aa.flatten
building_use_a = building_use_aa.flatten
antenna_height_a = antenna_height_aa.flatten
spire_height_a = spire_height_aa.flatten
roof_height_a = roof_height_aa.flatten



building_id_a.each do |id|
	ids = id.to_s	
	bldg = HTTParty.get('http://skyscraperpage.com/cities/?buildingID='+ids)

	bldg_rdom = Nokogiri::HTML(bldg)

	bldg_med = bldg_rdom.css('.med')

	building_address = bldg_med[5].child.child.to_s.gsub('<br>',' ').gsub('<td>', '').gsub("\n</td>", "")[0...-1]

	building_address_a.push(building_address)

end

# Pry.start(binding)

# Pry.start(binding)

i = 0 
	buildings = []
puts "there are #{building_id_a.length} objects to iterate over"
while i < building_id_a.length
	puts "iterating over object #{i + 1} of #{building_id_a.length}"
	h = Hash.new
	buildings.push(h)

	h["building_id"] = building_id_a[i].to_i
	h["building_name"] = building_name_a[i]
	h["city_name"] = city_name_a[i]
	h["image_width"] = image_height_a[i].to_i
	h["image_height"] = image_height_a[i].to_i
	h["drawing_id"] = drawing_id_a[i].to_i
	h["drawing_date_added"] = drawing_date_added_a[i]
	h["city_id"] =  city_id_a[i].to_i
	h["state_id"] = state_id_a[i].to_i
	h["state_abbreviation"] = state_abbreviation_a[i]
	h["country_id"] = country_id_a[i].to_i
	h["country_name"] = country_name_a[i]
	h["illustrator_id"] = illustrator_id_a[i].to_i
	h["illustrator_name"] = illustrator_name_a[i]
	h["status_id"] = status_id_a[i].to_i
	h["status"] = status_a[i]
	h["finished"] = finished_a[i].to_i
	h["floors"] = floors_a[i].to_i
	h["building_use"] = building_use_a[i]
	h["antenna_height"] = antenna_height_a[i].to_f
	h["spire_height"] = spire_height_a[i].to_f
	h["roof_height"] = roof_height_a[i].to_f

	h["building_address"] = building_address_a[i]

	i += 1
end
Pry.start(binding)




