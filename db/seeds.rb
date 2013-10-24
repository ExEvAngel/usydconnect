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

# Pinned Posts
 Athread.create(user_id: user.id, title: 'Rules' ,body: 'Before posting any threads/comments on the forum, all users must agree to abide by all the proceeding forum rules 
 												- Do not include any threads and/or posts that contain any offensive language 
 												- Do not post any content that will reveal any personal information about any other member of the forum 
 												- Do not post any offensive or insulting content 
 												- Do not impersonate another forum member 
 												- Do not spam the forum with repeated threads')

 thread = Athread.create(user_id: user.id, title: 'Error' ,body: 'In the event of an error, please attempt the following fixes: 
 			Refresh your browser page, 
 			Restart your browser, 
 			Use a different browser to verify whether the problem persists')

 Comment.create(user_id: user.id, athread_id: thread.id, body: 'In the event that all these options fail, you may then notify one of the active moderators of the problem. 
 Please note that fixes may not be immediate and could require some time to find a solution if the problem is not localised to your machine.')


# Achievement Images

# image url for first new thread
# http://i239.photobucket.com/albums/ff97/ru46t9/achievements/lvl1a.jpg

# first comment
# http://i239.photobucket.com/albums/ff97/ru46t9/achievements/lvl7a.jpg

# reaching 100xp
# http://i239.photobucket.com/albums/ff97/ru46t9/achievements/lvl10a.jpg