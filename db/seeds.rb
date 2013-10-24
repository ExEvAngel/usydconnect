# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'mod', email: 'mod@uni.sydney.edu.au', password: '123456', member_since: Time.now)
Moderator.create(user_id: user.id, moderator_since: Time.now)

Tag.create([{name: 'General'}, {name: 'Assignment'}, {name: 'Content'}, {name: 'Unit'}, {name: 'Staff'}, {name: 'Exams'}])
Unitcode.create([{name: 'General'}, {name: 'COMP'}, {name: 'ELEC'}, {name: 'INFO'}, {name: 'ISYS'}])