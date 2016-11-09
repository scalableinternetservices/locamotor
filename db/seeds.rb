# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

location = Location.create! :address =>'Goleta'

for i in 1..100
	user = User.create! :email => 'user' + i.to_s + '@gmail.com', :password => '1234567', :password_confirmation => '1234567'
	post = Post.create! :email => 'user' + i.to_s + '@gmail.com', :vehicle => 'car', :start_time => DateTime.parse('01/01/2016, 12:00PM'), :end_time => DateTime.parse('01/01/2016, 12:00PM'), :price => '10', :max_radius => '25', :auto_book => 'auto_book', :start_location_id => location.id, :post_type => 'FR', :creator_id => user.id
end