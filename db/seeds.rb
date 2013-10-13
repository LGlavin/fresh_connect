# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'csv'

# CSV.foreach("db/markets.csv", headers:true) do |row| 

#     market = markets.where({
#       name: row[1],
#       address: row[2],
#       city: row[3],
#       postal_code: row[4].gsub(/\D/, "").to_i,
#       latitude: row[5].gsub(/\D/, "").to_i,
#       longitude: row[6].gsub(/\D/, "").to_i
#       }).first
  
#     if market.nil?
#       market = markets.new ({
#       name: row[1],
#       address: row[2],
#       city: row[3],
#       postal_code: row[4].gsub(/\D/, "").to_i,
#       latitude: row[5].gsub(/\D/, "").to_i,
#       longitude: row[6].gsub(/\D/, "").to_i
#       })
        
#         market.save!
#       end

# end



csv_path = Rails.root.join(*%w(db markets.csv)).to_s

class LocationParser
  def initialize(data)
    @data = data
  end

  def name
    @data['Name']
  end


  def address
    @data['Address']
  end

  def city
    @data['City']
  end

  def state
    @data['State']
  end

  def postal_code
    @data['Zip']
  end

  def latitude
    @data['Latitude']
  end

  def longitude
    @data['Longitude']
  end

  def attributes
    [:name, :address, :city,:state, :postal_code].inject({}) do |result, attribute_name|
      result[attribute_name] = send(attribute_name)
      result
      end
  end
end
CsvIterator.iterate(csv_path) do |row|
  location_parser = LocationParser.new(row)
  attributes = location_parser.attributes
  # if [:postal_code].present?
  #   record = Location.where(address: attributes[:store_number]).first_or_initialize
  #   record.update_attributes(location_parser.attributes)
  end

