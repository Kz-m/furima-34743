class AddFamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :familiy_name, :string
  end
end
