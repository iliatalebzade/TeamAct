require 'net/http'
require 'json'

namespace :import_countries_by_api do
  desc 'Import countries by api'
  task :countries => :environment do
    # ENV variable is needed
    apikey = "xUQECyYMFyjvhgnjMIHTx4qo2HyeNsjnZCGaapxJ"

    # Fetch country data
    country_url = "https://countryapi.io/api/all?apikey=#{apikey}"
    country_uri = URI(country_url)
    country_response = Net::HTTP.get(country_uri)
    country_data = JSON.parse(country_response)

    i = 0
    country_data.each do |key, value|
      i += 1
      puts i
      country = Country.find_by(iso3: value['alpha3Code'])
      if country.nil?
        puts "#{value['name']} does not exist"
        country = Country.new(name: value['name'])
        country.region = value['region']
        country.latitude = value['latLng']['country'][0]
        country.longitude = value['latLng']['country'][1]
        country.iso2 = value['alpha2Code']
        country.iso3 = value['alpha3Code']
        country.phone_code = value['callingCode']
        country.emoji = ""
      end
      unless country.flag.attached?
        puts "#{country['name']} has no flag"
        # Attach flag
        flag_image_url = value['flag']['small']
        country.flag.attach(io: URI.open(flag_image_url), filename: "#{country.iso3}_flag.png", content_type: 'image/png')
      end

      result = country.save
      puts result
      unless result
        puts country.errors.full_messages
      end
    end
    puts 'Country data has been updated the database.'
  end

  private

end
