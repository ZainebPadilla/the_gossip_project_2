class CreatePrivateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :sender, foreign_key: { to_table: :users }
      t.references :recipient, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end