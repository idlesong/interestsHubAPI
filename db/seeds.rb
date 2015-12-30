# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#tags
web_design_words = %w{ruby rails javascript react redux nodejs}
linux_words = %w{linux debian gnome linux_desktop}
google_words = %w{google googleplus android chrome nexus}
geek_words = %w{android_tv xbox xmbc raspberrypi}
softeware_words = %w{gnomesoftware gimp atom vlc}

all_words = web_design_words + linux_words + google_words + geek_words + softeware_words
#use tags to define a user, then publish a post with tags
all_words.each do |word|
  tag = Tag.create(tag: word)

  name = "#{word}_guy"
  email = "#{name}@hub.com"
  password = "abc123"
  guy = User.create!( name: name, password: password, password_confirmation: password)
  guy.tags << tag

  content = Faker::Lorem.sentence(10)
  user_post = guy.posts.create({content: "title: about #{word} ---- #{content}"})
  user_post.tags << tag
  guy.tags << tag
end

idlesong = User.create(name: 'idlesong', email: 'idlesong@hub.com', password: 'abc123', password_confirmation: 'abc123')
stallman = User.create(name: 'stallman', email: 'stallman@hub.com', password: 'abc123', password_confirmation: 'abc123')


# tag_groups
web_design_group = Group.create(name:'IT幻想改变生活')
linux_group = Group.create(name: 'LinuxWorld')
google_group = Group.create(name: 'Google')
geek_group = Group.create(name: 'GeekWorld')
software_group = Group.create(name: 'LinuxSoftware')

web_design_group.tags << Tag.where(tag: web_design_words)
linux_group.tags << Tag.where(tag: linux_words)
google_group.tags << Tag.where(tag: google_words)
geek_group.tags << Tag.where(tag: geek_words)
software_group.tags << Tag.where(tag: softeware_words)

# special feeds
idlesong_post = idlesong.posts.create({content: 'yeman redux and so on'})
idlesong_post.tags << Tag.where("tag = ?", "redux")
stallman_post = stallman.posts.create({content: 'Introduce GNU world'})
stallman_post.tags << Tag.where("tag = ?", "linux")

# user groups add
idlesong.groups << geek_group
idlesong.groups << web_design_group
idlesong.tags << geek_group.tags
idlesong.tags << web_design_group.tags
idlesong.tags << idlesong_post.tags

stallman.groups << linux_group
stallman.groups << software_group
stallman.tags << linux_group.tags
stallman.tags << software_group.tags
stallman.tags << stallman_post.tags


users = User.all
user = idlesong #users.first
following = users[2..10]
followers = users[11..19]

following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
