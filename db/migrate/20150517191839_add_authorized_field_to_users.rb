class AddAuthorizedFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorized, :boolean
  end
end
