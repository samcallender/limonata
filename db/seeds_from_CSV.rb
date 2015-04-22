# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'Pry'
require 'csv'

csv_file_path = 'buildings_v1.csv'

CSV.foreach(csv_file_path) do |row|
	Building.create! ({
	building_id: row[1],	
	building_name: row[2],
	city_name: row[3],
	image_width: row[4],
	image_height: row[5],
	drawing_id: row[6],
	city_id: row[7],
	state_id: row[8],
	state_abbreviation: row[9],
	country_name: row[10],
	status_id: row[11],
	status: row[12],
	finished: row[13],
	floors: row[14],
	building_use: row[15],
	antenna_height: row[16],
	spire_height: row[17],
	roof_height: row[18]
	})
end
	
# Line below is the headers from the buildings_v1.csv file.
# id,building_id,building_name,city_name,image_width,image_height,drawing_id,city_id,state_id,state_abbreviation,country_name,status_id,status,finished,floors,building_use,antenna_height,spire_height,roof_height,created_at,updated_at

