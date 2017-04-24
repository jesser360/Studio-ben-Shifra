class AddProductReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :product, foreign_key: true
  end
end
