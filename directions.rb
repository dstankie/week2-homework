require 'open-uri'
require 'json'

#Prompt for origin and destination
print "Enter an address, city, or zip code: "
orig = gets.chomp.gsub(" ","+")
print "Enter an address, city, or zip code: "
dest = gets.chomp.gsub(" ","+")

#Submit request to google directions api and parse results
json_data = open("http://maps.googleapis.com/maps/api/directions/json?origin=#{orig}&destination=#{dest}&sensor=false").read
data = JSON.parse(json_data)

#Extract driving time and distance
data = data['routes'][0]['legs'][0]
print 'Total travel time driving: ', data['duration']['text'], "\n"
print 'Total distance traveled: ', data['distance']['text']