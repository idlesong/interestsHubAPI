class Tag < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :groups

  has_many :subscriptions
end
