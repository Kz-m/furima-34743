class AddItemToPurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchase_histories, :item, null: false, foreign_key: true
  end
end
