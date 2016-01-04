#interestsHub
根据兴趣组织的信息聚合和发布平台。（兴趣小组－聚合论坛）

1. 兴趣点／tag:
  - 每个tag表示一个兴趣点，tag是所有信息分类互动的基础（发帖，转帖，聚合）
  - 用户可以订阅其他用户的tag，然后该用户相关tag的post，则会聚合到自己的订阅信息流中
2. 兴趣小组／tags group:
  - 多个tag组成一个兴趣小组，个人的信息流feed，就是多个的小组集合。
  - 兴趣点tag有支持者，即一般订阅是单向的，但tag支持者是双向的，可以接纳新手。
3. 多个tag支持者可以联合成一个论坛。
4. P2P支持
  - 后期，可以考虑在zeronet的平台上实现一个P2P的应用.
  - 这样有了订阅者，信息就可以在多个订阅者和作者之间同步，信息就可以永久保存在网上。

## Design(brain storm)
### interests hub
1. 将跨多个兴趣小组的内容Filter到自己的interest hub中，形成个人的页面（分主题）。
  - 不再受小组论坛的限制，内容由用户做主，小组只是一个松散的协议。
  - 小组成员共同保存小组的profile（地址，匿名），成员必须keep一个tag内容
  - 个人Profile中，兴趣是最大的重心，很好的表现很重要。
  - 聚合内容的展现的优先级以兴趣相关度，时间，社交三个关键因素决定。比如以时间为主线，但好友推荐之类的可以续命。
2. 有粉丝回馈机制，双向互动，比如接纳新手问题等
  - 关注多少人，就有义务接纳多少粉丝信息（体现从平台获取多少资源，就有义务反馈多少人的原则）
  - 但粉丝的信息仅限每天1条，如果其他粉丝没有信息，可协调给其他人

### demo的简单实现（rails）
1. 用户发帖时自动将tags整理到profiles（grouped，ungrouped）
1. 用户订阅其他用户的特定tag（或channel：tag group）
1. 用户订阅tag的整理，特定channel（tags group），特定node
- 当订阅新客户的tag时，自动分类到自己相应channel下面
－ 如果订阅channel，则比较麻烦：可以考虑拆分grouped tags
1. 个人在profile中把这些订阅整理成，tag group，每个根group是一个channel
－ 其他人可以订阅其频道，那这个用户就类似群主的功能。
－ 每个channel可以有相应的匿名（如自学成裁），和logo
1. 有一个粉丝的订阅源，接纳粉丝的信息

### P2P内容存储
1. 同好保存：好友相互备份内容
1. 小组成员共同保存
1. 订阅的内容，自动保存在本地。
1. 互动的帖子很自然会保存，原帖不在也保存

### brain storm
1. 小组是聚合了多个成员的信息，成员的收藏帖，自然整合到置顶位置，收藏人越多越表示重要
1. 个人的tag分类可以拓展，比如个人的所有订阅可以成为一个source源，然后可以按层级，按类型分类展示，如：
－ 安卓，可以显示按机型设置tag，展示一个个机型，然后订阅者可以在其上订阅自己机型tag，然后该tag的所有sources自动订阅
－ 版主只是汇总整理各个其订阅的sources，其内容由sources决定。
1. 有一个粉丝的订阅源，接纳粉丝的信息 －》这样是否新手只会到别人帖子下留言了？
1. 精华帖按照fav以及转发数确定，保存到特定的数据库
1. 订阅的tag group结构，与自己post自动生成的tag group如何整理？


1. 个人post的tags自动汇总到profile，即profile 有个tags list
1. 基本的tag即可满足基本要求
－ ｜＃民国 ＃历史 自然是或的关系
－ & ＃民国历史 在订阅源汇总到个人tag页面的时候自动分词。即比如个人tag group中有历史，自动分出历史。
－ ～＝ 直接按或的关系，只展示模糊的相关性，不需要精确的维基百科的方式。
－ 体现个性化和趣味性，通过昵称，tag尽量通用
1. tag维护者（信鸽角色），即用户可以在声明为维护者，此时用户关注即回关注，且维护用户列表
－ user base类似mailing list
－ gnome@idlesong gnome@@idlesong
1. 个人兴趣主题 tag groups
－ tag是兴趣点，tag groups是兴趣主题
－ 类似自己的论坛，自己有完全的权限控制所有内容
1. 多个不同tag维护者，可以联合成一个论坛
－ channel的信息需要随时同步
－ 论坛维护者需要双向确认，邀请者需要

## relevant apps

1. forum: v2ex
1. merge sites: planet.gnome.org xbeta.info
1. google reader
1. google+ forum

## associations
user has_many posts
post belongs_to user

user has_many tags (interest point)  
tag belongs_to user

user has_many tag_groups (interest)
tag_group belongs_to user

post has_and_belongs_to_many tags
tag has_and_belongs_to_many posts

user has_and_belongs_to_many followings through Relationship
user has_and_belongs_to_many followers through Relationship
