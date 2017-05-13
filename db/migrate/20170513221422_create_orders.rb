class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :items
      t.integer :amount
      t.string :image
      t.boolean :is_bought
      t.integer :quantity
      t.timestamps
    end
  end
end
