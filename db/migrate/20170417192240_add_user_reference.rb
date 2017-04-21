class AddUserReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :user
  end
end
