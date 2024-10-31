class AddLikesCountToGossips < ActiveRecord::Migration[7.2]
  def change
    add_column :gossips, :likes_count, :integer, default: 0
  end
end
