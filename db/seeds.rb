# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create! :address =>'LA, CA'
Location.create! :address =>'Santa Barbara, CA'
Location.create! :address =>'San Diego, CA'
Location.create! :address =>'Irvine, CA'
Location.create! :address =>'Ventura, CA'
Location.create! :address =>'Pasadena, CA';;;;

100.times do |count|
  User.create(email: "user#{count+1}@gmail.com", password: "1234567", password_confirmation: "1234567")
end

inserts = []
10.times do
  inserts.push "('user1@gmail.com', 'Car', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 1, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 1, 'auto_book_true', 100, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, creator_id, auto_book, max_radius, start_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
100.times do
  inserts.push "('user1@gmail.com', 'Car', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 2, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 2, 'auto_book_true', 100, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, creator_id, auto_book, max_radius, start_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

300.times do
  inserts.push "('user1@gmail.com', 'Bike', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 3, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 2, 'auto_book_true', 100, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, creator_id, auto_book, max_radius, start_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)

inserts = []
400.times do
  inserts.push "('user1@gmail.com', 'Truck', '2016-11-17 17:00:00', '2016-11-17 17:00:00', 'skeddit', 4, '2016-01-02 01:00:00', '2016-06-05 01:00:00', 3, 'auto_book_true', 100, 1)"
end
sql = "INSERT INTO posts (email, vehicle, created_at, updated_at, description, price, start_time, end_time, creator_id, auto_book, max_radius, start_location_id) VALUES #{inserts.join(", ")}"
ActiveRecord::Base.connection.insert_sql(sql)