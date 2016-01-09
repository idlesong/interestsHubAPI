class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :tags
  has_many :groups
  has_many :subscriptions

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def feed
    following_ids = "SELECT followed_id FROM relationships
    WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
    OR user_id = :user_id", user_id: id).order(created_at: :desc)
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def info_feed
    my_subscribed_tags = "SELECT tag_id FROM subscriptions WHERE user_id = :user_id"
    # Post.tags.where("tag_id IN (#{my_subscribed_tags})", user_id: id).order(created_at: :desc)
  end

  def subscribe(other_user_tag)
    # Tag.where()
    subscriptions.create(tag_id: other_user_tag.id)
  end

  def unsubscribe(other_user_tag)
    subscriptions.find_by(tag_id: other_user_tag.id).destroy
  end

  def subscribing?(other_user_tag)
    subscription = subscriptions.find_by(tag_id: other_user_tag.id)
    subscriptions.include?(subscription)
  end

end
