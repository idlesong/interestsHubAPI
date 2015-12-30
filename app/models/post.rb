class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user

  scope :with_tag, ->(tag){ where("tags.tag = ?", tag)}
  scope :inside_group, ->(group_tags){ where("tags.tag = ?", group_tags)}
end
