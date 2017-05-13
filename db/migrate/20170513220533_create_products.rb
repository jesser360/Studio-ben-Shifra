class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.text :description
      t.string :image
      t.string :title
      t.timestamps
    end
  end
end
