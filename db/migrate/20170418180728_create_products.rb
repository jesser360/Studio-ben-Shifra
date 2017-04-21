class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :description
      t.string :image
      t.string :title
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
