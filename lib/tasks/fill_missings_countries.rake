require 'net/http'
require 'json'

namespace :fill_missings_countries do
  desc 'Add alpha2Code to Countries'
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
        # Attach flag
        flag_image_url = value['flag']['small']
        country.flag.attach(io: URI.open(flag_image_url), filename: "#{country.iso3}_flag.png", content_type: 'image/png')
        result = country.save
        puts result
        unless result
          puts country.errors.full_messages
        end
      end
    end
    json_file = File.read('/home/alirezash/Projects/TeamAct/lib/tasks/countries.json')
    data = JSON.parse(json_file)

    i = 0
    data.each do |record|
      i += 1
      puts i
      country = Country.find_by(iso3: record['iso3'])
      if country.nil?
        puts "#{record['name']} does not exist"
        puts "#{record}"
        country = Country.new(name: record['name'])
        country.region = record['region']
        country.latitude = record['latitude']
        country.longitude = record['longitude']
        country.iso2 = record['iso2']
        country.iso3 = record['iso3']
        country.phone_code = record['phone_code']
        result = country.save
        puts result
        unless result
          puts country.errors.full_messages
        end
      end

      result = country.update(emoji: record['emoji'], latitude: record['latitude'], longitude: record['longitude'])
      puts result
    end
  end

  private

end
