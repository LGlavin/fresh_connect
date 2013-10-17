# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach("db/markets.csv", headers:true) do |row|

market = Market.where({
  state: row[0],
  name: row [1],
  address: row[2],
  city: row[3],
  postal_code: [4],
  longitude: [5],
  latitidue: [6]
  }).first 

if market.nil?
  market = Market.new({
  state: row[0],
  name: row [1],
  address: row[2],
  city: row[3],
  postal_code: [4],
  longitude: [5],
  latitidue: [6]
    })
  market.save!
  end
end