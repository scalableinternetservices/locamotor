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

100.times do |count|
  User.create(email: "user#{count+1}@gmail.com", password: "1234567", password_confirmation: "1234567")
end

inserts = []
100.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
1000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
2000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 2, 2)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
3000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 3, 3)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
4000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 4, 4)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
5000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 5, 5)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
6000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 6, 6)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
100000.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 'FR', 1, 'auto_book_true', 100, 1, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, post_type, creator_id, auto_book, max_radius, start_location_id, general_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)