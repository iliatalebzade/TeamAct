namespace :import_countries_by_json do
  desc "Import countries from JSON"
  task countries: :environment do
    # ENV variable is needed
    json_file = File.read('/home/alirezash/Projects/TeamAct/lib/tasks/countries.json')
    data = JSON.parse(json_file)

    i = 0
    data.each do |record|
      i += 1
      puts i
      country = Country.find_by(iso3: record['iso3'])
      if country.nil?
        puts "#{record['name']} does not exist"
        country = Country.new(name: record['name'])
        country.region = record['region']
        country.latitude = record['latitude']
        country.longitude = record['longitude']
        country.iso2 = record['iso2']
        country.iso3 = record['iso3']
        country.phone_code = record['phone_code']
      end
      country.emoji = record['emoji']

      result = country.save
      puts result
      unless result
        puts country.errors.full_messages
      end
    end

    puts "Database populated successfully!"
  end
end
