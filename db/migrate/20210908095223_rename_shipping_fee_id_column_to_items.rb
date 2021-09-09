class RenameShippingFeeIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_fee_id, :shipping_fee_id
  end
end
