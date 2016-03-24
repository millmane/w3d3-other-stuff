# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Visit.destroy_all

5.times do |x|
  user = User.create!(email: "hi#{x}")
  Visit.create!(user_id: user.id, shortened_url_id: x + 1)
end
