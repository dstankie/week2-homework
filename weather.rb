#Daniel Stankiewicz
#MPCS52553 Winter 2014
#Homework week 2

require 'open-uri'
require 'json'

#Prompt the user for address and replace all spaces with '+'
print "Please enter an address: "
address = gets.chomp.gsub(" ","+")

#Submit query to google map api, parse the JSON data, and store it in 'data_address'
json_data_address = open("http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false").read
data_address = JSON.parse(json_data_address)
#Extract latitude and longitude
lat = data_address['results'][0]["geometry"]["location"]["lat"]
lng = data_address['results'][0]["geometry"]["location"]["lng"]

#Use lat,lng as parameters to OpenWeatherMap query and parse the resulting JSON data
json_data_temp = open("http://api.openweathermap.org/data/2.5/find?lat=#{lat}&lon=#{lng}").read
data_temp =  JSON.parse(json_data_temp)

#Dig into the JSON data and extract the temperature.
#Temp is in Kelvin so convert to Fahrenheit before displaying
#Also round it to 2 decimal places
tempK = data_temp['list'][0]['main']['temp']
tempF = ((tempK - 273.15)*1.8 + 32).round(2)
print tempF,"f\n"
