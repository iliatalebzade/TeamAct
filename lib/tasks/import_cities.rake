require 'net/http'
require 'json'

namespace :import_cities do
  desc 'Import cities from JSON'
  task cities: :environment do
    # ENV variable is needed
    json_file = File.read('/home/alirezash/Projects/TeamAct/lib/tasks/cities.json')
    data = JSON.parse(json_file)

    i = 0
    missings = []
    data.each do |record|
      i += 1
      puts i
      country = Country.find_by(iso2: record['country_code']) || Country.find_by(iso3: record['country_code'])
      if country.nil?
        puts "there is no country #{record['country_code']}"
        next
      end
      city = City.new(name: record['name'])
      city.country = country
      city.latitude = record['latitude']
      city.longitude = record['longitude']

      result = city.save
      puts result
      unless result
        puts city.errors.full_messages
      end
    end

    puts "Database populated successfully!"
  end
end
