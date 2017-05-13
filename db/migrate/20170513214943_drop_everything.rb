class DropEverything < ActiveRecord::Migration[5.0]
  def change
    drop_table :messages
    drop_table :users
    drop_table :products
    drop_table :orders

  end
end
