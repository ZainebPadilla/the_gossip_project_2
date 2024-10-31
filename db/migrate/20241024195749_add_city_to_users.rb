class AddCityToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :city, foreign_key: true, null: true
  end
end