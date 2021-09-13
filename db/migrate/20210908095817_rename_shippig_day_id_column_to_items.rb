class RenameShippigDayIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shippig_day_id, :shipping_day_id
  end
end
