class AddUserIdToArtices < ActiveRecord::Migration[7.1]
  def change
    add_reference :artices, :user, null: false, foreign_key: true
  end
end
