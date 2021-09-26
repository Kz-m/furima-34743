class AddUserToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_histories, :user, null: false, foreign_key: true
  end
end
