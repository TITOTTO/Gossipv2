class Commenttogossip < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :gossip, foreign_key: true
  end
end
