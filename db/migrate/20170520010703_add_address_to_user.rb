class AddAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :zipcode, :integer
    add_column :users, :name, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :apartment, :string
  end
end
