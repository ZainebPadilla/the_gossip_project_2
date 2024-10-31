class AddLikesToGossips < ActiveRecord::Migration[7.2]
  def change
    add_column :gossips, :likes, :integer, default: 0
  end
end
