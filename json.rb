require 'rubygems'
require 'json'
require 'open-uri'

contents = File.read('resart.json')
residencies = JSON.parse(contents)
countries = Array.new
residencies.each do |residency|
	#if residency["Country"] == ""
		countries.push(residency["Country"])
	#end
end
puts countries.uniq