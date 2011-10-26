# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

platitudes = File.readlines(Rails.root.join('db', 'fortunes.u8'), "\n%\n")
platitudes.map do |p|
  reg = /\t?(.+)\n\t\t--\s*(.*)\n%\n/m
  m = p.match(reg)
  if m
    Fortune.create :body => m[1], :author => m[2]
  else
    Fortune.create :body => p[0..-4], :author => Faker::Name.name
  end
end
