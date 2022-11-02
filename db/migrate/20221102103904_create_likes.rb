class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :comment
      t.belongs_to :gossip

      t.timestamps
    end
  end
end
