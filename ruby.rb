require 'nokogiri'
require 'open-uri'

#load the countries file
countries_file = open('semi_arid_countries.csv') {|countries| countries = countries.read
#split it into an array
countries = countries.gsub(/\s+/, " ").strip.split(",")

for i in 1..50
#get the first page of results
url = 'http://www.resartis.org/en/residencies/' + '?site=' + i.to_s
doc = Nokogiri::HTML(open(url))
#get the nodes on the page
doc.css('.teaser_container').each do |resartis_country_html|
	node = resartis_country_html.at_css('.teaser_head a')
	puts node.values
	node.values.each do |value|
		innerurl = 'http://www.resartis.org/en/residencies/' + value
		innerdoc = Nokogiri::HTML(open(innerurl))
		puts innerdoc.css('#content_right p')
		#puts innerdoc	
	end
	#puts resartis_country_html.css('.teaser_body')
	#for each of the nodes on the page (split by camelCase)
	#resartis_country_html.content.split('\n').each do |resartis_country|
		#is it in the countries array?
		#countries.each do |country|
			#country = country.downcase.gsub(/\s+/, " ").strip
			#resartis_country = resartis_country.downcase.gsub(/\s+/, " ").strip
			#if resartis_country.include?(country)
			#	puts resartis_country
			#else
			#end
		#end
	#end
	#puts resartis_country_html
end
end
}