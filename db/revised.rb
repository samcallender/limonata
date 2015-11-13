# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'
require 'nokogiri'
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

# USA diagrams
	# sprint 1 group
	'67906779' => 'New York',
	'67919387' => 'Chicago',
	'67908320' => 'Seattle',
	'67919769' => 'San Francisco',

	# sprint 2 group
	# '67919362' => 'Los Angeles'
	# '67919438' => 'Philadelphia' 


	# '67919314' => 'Atlanta'

	# '67919665' => 'Boston',
	# '67919674' => 'Miami',
	# '67919405' => 'Dallas',
	# '67919428' => 'Houston',
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
	# nyc timeline
	# '67920028' => 'nyc timeline'

		# # INTERNATIONAL CITY
	# '67985207' => 'Dubai',
	# dubai only has 3 pages
	# '67929489' => 'Hong Kong',
	# '67929711' => 'Shanghai',
	# '67929564' => 'Seoul',
	# '67919160' => 'Toronto',
	# '67929510' => 'London',
	# '67929533' => 'Tokyo',
	# '67929543' => 'Jakarta',
	# '67985192' => 'Taipei',
	# '67929620' => 'Sydney',
	# '67929630' => 'Kuala Lumpur',
	# '67929695' => 'Mumbai'

	# '67929519' => 'Mexico City',
	# '67929569' => 'Buenos Aires',
	# '67929586' => 'Sao Paulo',
	# '67929601' => 'Moscow',
	# '67929646' => 'Frankfurt',
	# '67929680' => 'Madrid',
	# '67929686' => 'Tel Aviv',
	}

# scrapes the first page of each city search page
# input search page id's for selected diagrams into diagrams_id_a
city = HTTParty.get('http://skyscraperpage.com/diagrams/?cityID=8')
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

Pry.start(binding)
