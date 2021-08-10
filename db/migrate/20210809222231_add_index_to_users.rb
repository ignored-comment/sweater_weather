class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_key, :string, unique: true
  end
end
