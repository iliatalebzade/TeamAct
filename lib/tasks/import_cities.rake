require 'net/http'
require 'json'

namespace :import_cities do
  desc 'Import cities from RapidAPI and populate the database'
  task cities: :environment do
    # ENV variable is needed
    url = URI(" https://www.universal-tutorial.com/api/states/United States")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "yqNZl0GLev-ecjb0Yl7qvY35lVxi1iDsrEZp8HYviaLxWQRVQMBl6PCymwqtfx5tcr0"

    response = http.request(request)
    puts response

    cities_data = JSON.parse(response)
    puts cities_data
    # Iterate over cities data and create city records
    cities_data.each do |city_data|
      if country.name == "Iran"
        puts city_data['name']
      end
      # city = City.new(name: city_data['name'])
      # city.country = country
      # city.save
    end

    puts "Imported cities for #{country.name}"
  end
end
