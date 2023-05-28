require 'net/http'
require 'json'

namespace :import_countries do
  desc 'Fetch countries data from countryapi API and populate the database'
  task :countries => :environment do
    # ENV variable is needed
    apikey = "PJrBSrlLHZFiKN8D2WKeJEA1cOY1TtgOTODt5jVV"

    # Fetch country data
    country_url = "https://countryapi.io/api/all?apikey=#{apikey}"
    country_uri = URI(country_url)
    country_response = Net::HTTP.get(country_uri)
    country_data = JSON.parse(country_response)

    country_data.each do |key, value|
      country = Country.new(alpha3_code: value['alpha3Code'])
      country.name = value['name']
      country.phone_code = value['callingCode']
      country.region = value['region']
      country.latitude = value['latLng']['country'][0]
      country.longitude = value['latLng']['country'][1]

      # Attach flag
      flag_image_url = value['flag']['small']
      country.flag.attach(io: URI.open(flag_image_url), filename: "#{country.alpha3_code}_flag.png", content_type: 'image/png')

      country.save

    end

    puts 'Country data has been fetched and saved to the database.'
  end

  private

end
