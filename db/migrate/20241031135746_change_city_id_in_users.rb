class ChangeCityIdInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :city_id, true  # Permettre que city_id soit NULL
  end
end
