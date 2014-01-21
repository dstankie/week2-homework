require 'open-uri'
require 'json'

#prompt for user input, replace spaces with '+'
print "Enter an address, city, or zip code: "
address = gets.chomp.gsub(" ","+")

#submit request to google geolocation api and parse as JSON data
json_data = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data = JSON.parse(json_data)

#extract longitude and latitude
data = data['results'][0]["geometry"]["location"]
print "Latitude: " , data["lat"], "\n"
print "Longitude: " , data["lng"], "\n"
