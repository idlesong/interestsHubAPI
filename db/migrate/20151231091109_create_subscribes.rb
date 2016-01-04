class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.integer :tag_id, index: true
      t.timestamps null: false
    end
  end
end
