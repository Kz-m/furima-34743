class RenameStateIdColumnToPrefectureId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :state_id, :prefecture_id 
  end
end
