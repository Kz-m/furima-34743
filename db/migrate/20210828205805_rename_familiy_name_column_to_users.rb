class RenameFamiliyNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :familiy_name, :family_name 
  end
end
