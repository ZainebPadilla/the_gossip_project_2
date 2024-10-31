class CreateTaggedGossips < ActiveRecord::Migration[7.2]
  def change
    create_table :tagged_gossips do |t|
      t.references :gossip, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
