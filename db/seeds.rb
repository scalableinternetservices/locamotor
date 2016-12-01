# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

general_address = GeneralLocation.GetGeneralAddress("Los Angeles", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("200 N Spring St", "Los Angeles", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

general_address = GeneralLocation.GetGeneralAddress("Santa Barbara", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("928 State St", "Santa Barbara", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

general_address = GeneralLocation.GetGeneralAddress("San Diego", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("326 Broadway", "San Diego", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

general_address = GeneralLocation.GetGeneralAddress("Irvine", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("2 Meadowbrook", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

general_address = GeneralLocation.GetGeneralAddress("Ventura", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("4667 Telegraph Rd", "Ventura", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

general_address = GeneralLocation.GetGeneralAddress("Pasadena", "CA")
loc = GeneralLocation.create(address: general_address)
full_address = FullLocation.GetFullAddress("100 Garfield Ave", "Pasadena", "CA")
FullLocation.create(address: full_address, general_location_id: loc.id)

# 7
full_address = FullLocation.GetFullAddress("Spectrum", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 8
full_address = FullLocation.GetFullAddress("11 Strawberry Farm Rd", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 9
full_address = FullLocation.GetFullAddress("4115 Campus Drive", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 10
full_address = FullLocation.GetFullAddress("111 Peters Canyon Rd", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 11
full_address = FullLocation.GetFullAddress("100 Shady Canyon Dr", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 12
full_address = FullLocation.GetFullAddress("One Ethel Coplen Way", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

# 13
full_address = FullLocation.GetFullAddress("3750 Barranca Pkwy", "Irvine", "CA")
FullLocation.create(address: full_address, general_location_id: 4)

100.times do |count|
  User.create(email: "user#{count+1}@gmail.com", password: "1234567", password_confirmation: "1234567")
end

# Spectrum 7
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 7, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# Strawberry 8
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 8, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# 4115 Campus Drive 9
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 9, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# 111 Peters Canyon Rd 10
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 10, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# 100 Shady Canyon Dr 11
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 11, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# One Ethel Coplen Way 12
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 12, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

# 3750 Barranca Pkwy 13
inserts = []
20.times do |counter|
  inserts.push "('user#{counter}@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', #{counter * .5}, 13, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)


inserts = []
10.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
100.times do 
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
200.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 2, 2)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
300.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 3, 3)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
400.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 4, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
500.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 5, 5)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
600.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 6, 6)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
10000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)