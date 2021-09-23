class PurchaseForm #ship model + purchase_history model
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :locality, :address, :building_name, :phone_number#, :token #このクラスで扱う全ての値

  with_options presence: true do #attr_accessorの内容がtrueがどうか判定
    validates :user_id
    validates :item_id
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input hypen' }
    validates :prefecture_id, numericality: { other_than: 0, message: '' }
    validates :address
    validates :building_name

    VALID_PHONE_HALF = /\A\d{10}$|^\d{11}\z/.freeze
    validates :phone_number, format: { with: VALID_PHONE_HALF, message: 'is invalid. Input only half-width caracter' }
    #validates :token
  end

  def save #各テーブルに保存する
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id ) #shipsテーブルの外部キーであるpurhcase_history_idはここで生成し、Shipsテーブルでの保存のため渡す
    Ship.create(zipcode: zipcode, prefecture_id: prefecture_id, locality: locality, address: address, building_name: building_name, phone_number: phone_number, purchase_history: purchase_history)
  end
end
