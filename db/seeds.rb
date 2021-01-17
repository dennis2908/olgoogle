# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_list = [
  [ "Dennis", '111' ],
  [ "Maman", '222' ],
  [ "Daeng", '333'],
  [ "Zen", '444' ]
]

location_list = [
  [ 1, -7.644871999999999, 112.90329700000007,'Jl. KH. Abdul Hamid Gang 12, Bangilan, Pasuruan, East Java, 67114, Indonesia'],
  [ 2, -6.188597, 106.58851700000002,'Keroncong, Jatiuwung, Tangerang, Banten, 15133, Indonesia'],
  [ 3, -7.981894,112.62650299999996,'05, Kel Kauman, Kec Klojen, Kota Malang, Tanjungrejo, Malang, East Java, 65119, Indonesia'],
  [ 4, -6.202251,107.001587,'Jalan Kaliabang, Harapanjaya, West Java, 17125, Indonesia']
]

user_list.each do |name, pass|
  User.create( username: name, password: pass )
end
	
location_list.each do |id_user,latx,lngx,addx|
  Location.create( user_id: id_user, lat: latx, lng: lngx,add:addx )
end