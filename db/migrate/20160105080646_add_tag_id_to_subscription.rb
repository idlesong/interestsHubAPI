class AddTagIdToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :tag_id, :integer
  end
end
