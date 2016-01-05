# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:email => 'info@americangimuseum.org', :lastname => 'Admin', :firstname => 'Admin',:password=>'MAGIadmin',:gender=>'',:created_at=>'',:updated_at=>'',:salt=>'$2a$10$jhA61Mm9GFSg.pcqwzJphu',:encrypted_password=>'$2a$10$jhA61Mm9GFSg.pcqwzJphuB/zwJO5nUmvIm.JfPMY15/toN2oo6jW',:level=>'0'}
  	 ]

users.each do |user|
  User.create!(user)
end