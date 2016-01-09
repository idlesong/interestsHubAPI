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
  # tag = Tag.create(tag: word)

  name = "#{word}_guy"
  email = "#{name}@hub.com"
  password = "abc123"
  guy = User.create!( name: name, password: password, password_confirmation: password)
  tag = guy.tags.create(tag: word)
  guy.subscribe(tag)

  content = Faker::Lorem.sentence(10)
  user_post = guy.posts.create({content: "title: about #{word} ---- #{content}"})
  # user only can use his own tag to label post
  user_post.tags << tag
end

idlesong = User.create(name: 'idlesong', email: 'idlesong@hub.com', password: 'abc123', password_confirmation: 'abc123')
stallman = User.create(name: 'stallman', email: 'stallman@hub.com', password: 'abc123', password_confirmation: 'abc123')


# tags & tag_groups belongs_to user
web_design_group = idlesong.groups.create(name:'IT幻想改变生活')
geek_group = idlesong.groups.create(name: 'GeekWorld')

web_design_words.each do |word|
  w_tag = idlesong.tags.create(tag: word)
  web_design_group.tags << w_tag
  idlesong.subscribe(w_tag)
end
geek_words.each do |word|
  g_tag = idlesong.tags.create(tag: word)
  geek_group.tags << g_tag
  idlesong.subscribe(g_tag)
end

linux_group = stallman.groups.create(name: 'LinuxWorld')
software_group = stallman.groups.create(name: 'LinuxSoftware')

linux_words.each do |word|
  l_tag = stallman.tags.create(tag: word)
  linux_group.tags << l_tag
  stallman.subscribe(l_tag)
end
softeware_words.each do |word|
  s_tag = stallman.tags.create(tag: word)
  software_group.tags << s_tag
  stallman.subscribe(s_tag)
end

# special feeds
idlesong_post = idlesong.posts.create({content: 'yeman redux and so on'})
idlesong_post.tags << idlesong.tags.where("tag = ?", "redux")

stallman_post = stallman.posts.create({content: 'Introduce GNU world'})
stallman_post.tags << stallman.tags.where("tag = ?", "linux")
# stallman_linux_tag = stallman.tags.find_by_tag("linux")

# idlesong.subscribe( idlesong.tags.find_by_tag("redux") )
# idlesong.subscribe(stallman_linux_tag)

# users = User.all
# user = idlesong #users.first
# following = users[2..10]
# followers = users[11..19]
#
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }
