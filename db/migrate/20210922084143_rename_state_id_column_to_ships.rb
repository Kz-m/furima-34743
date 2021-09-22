class RenameStateIdColumnToShips < ActiveRecord::Migration[6.0]
  def change
    rename_column :ships, :state_id, :prefecture_id
  end
end
