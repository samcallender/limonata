require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'mechanize'

drawing_id_aa = []
diagrams_id_a = ['67906779']
diagrams_id_a.each do |n|

	city = HTTParty.get('http://skyscraperpage.com/diagrams/?searchID='+n)

	city_rdom = Nokogiri::HTML(city)

	city_med = city_rdom.css('.med')

	city_table = city_med[6]

	drawing_id_aa.push(city_table.to_s.split(';').map { |x| x.split(' = ') }.select { |x| x[0] == "data['image']['drawingID']"}[0][1].gsub("[",'').gsub("]",'').split(','))
end

drawing_id_a = drawing_id_aa.flatten

# Pry.start(binding)

drawing_id_a.each do |g|
	agent = Mechanize.new
	link = 'http://skyscraperpage.com/diagrams/images/'+g+'.gif'
	agent.get(link).save 'images/'+g+'.jpeg'
end