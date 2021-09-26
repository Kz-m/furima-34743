class RemoveUserFromShips < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ships, :user, null: false, foreign_key: true
  end
end
