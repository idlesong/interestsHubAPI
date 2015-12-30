class CreateJoinTableGroupsTags < ActiveRecord::Migration
  def change
    create_table :groups_tags, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :tag, index: true
    end
  end
end
