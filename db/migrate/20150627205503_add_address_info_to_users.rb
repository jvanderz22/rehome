class AddAddressInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :county, :string
    add_column :users, :date_of_birth, :date
  end
end
