class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string       :zipcode,           null: false
      t.integer      :state_id,          null: false
      t.string       :locality,          null: false
      t.string       :address,           null: false
      t.string       :building_name
      t.string       :phone_number,      null: false, unique: true
      t.references   :purchase_history,  foreign_key: true
      t.timestamps
    end
  end
end
