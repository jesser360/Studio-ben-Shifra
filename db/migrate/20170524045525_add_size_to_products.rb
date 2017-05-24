class AddSizeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :size, :string
    add_column :products, :materials, :string
    add_column :products, :custom, :boolean
  end
end
