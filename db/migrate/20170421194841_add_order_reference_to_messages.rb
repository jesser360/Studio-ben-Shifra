class AddOrderReferenceToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :order, foreign_key: true
  end
end
