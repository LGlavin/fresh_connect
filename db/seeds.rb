require 'CSV'

market_records = {}

CSV.foreach("db/data/market.csv", :headers => true) do |row|
  market_records[row[0]] = {
    :name => row['name'],
    :address => row['address'],
    :city => row['city'],
    :state => row['state'],
    :postal_code => row['postal_code'],
    :user_id => row['user_id'].to_i,
    :datetime => row['datetime']
  }
end

market_records.each do | key, values |
  record = Market.where({
    address: key
    }).first

  if record.nil?
    record = Market.new(values)
  else
    record.attributes = values
  end
  record.save!
end


user_records = {}

CSV.foreach('db/data/user.csv', :headers => true) do |row|
  user_records[row[0]] = {
    :username => row['username'],
    :email => row['email'],
    :password => row['password'],
    :password_confirmation => row['password_confirmation'],
  }
end

user_records.each do | key, values |
  record = User.where({
    username: key
  }).first

  if record.nil?
    record = User.new(values)
  else
    record.attributes = values
  end

  record.save!
end


recommendation_records = {}

CSV.foreach('db/data/recommendation.csv', headers: true) do |row|
  recommendation_records[row[0]] = {
    :user_id => row['user_id'],
    :market_id => row['market_id']
  }
end

recommendation_records.each do | key, values |
  record = Recommendation.where({
    user_id: key,
    market_id: key
  }).first

  if record.nil?
    record = Recommendation.new(values)
  else
    record.attributes = values
  end

  record.save!
end


# Seed reviews
review_records = {}

CSV.foreach('db/data/review.csv', headers: true) do |row|
  review_records[row[0]] = {
    :user_id => row['user_id'],
    :market_id => row['market_id'],
    :body => row['body']
  }
end

review_records.each do | key, values |
  record = Review.where({
    user_id: key,
    market_id: key
  }).first

  if record.nil?
    record = Review.new(values)
  else
    record.attributes = values
  end

  record.save!
  end


