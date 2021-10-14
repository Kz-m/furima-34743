# ship model + purchase_history model
class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :prefecture_id, :locality, :address, :building_name, :phone_number, :token # このクラスで扱う全ての値

  with_options presence: true do # attr_accessorの内容がtrueがどうか判定
    validates :user_id
    validates :item_id
    validates :zipcode
    validates :prefecture_id
    validates :locality
    validates :address
    validates :phone_number
    validates :token
  end

  VALID_ZIPCODE_NUM = /\A[0-9]{3}-[0-9]{4}\z/
  VALID_PHONE_HALF = /\A\d{10}$|^\d{11}\z/.freeze
  VALID_PHONE_MISSING = /\A\d{10,11}\z/
  VALID_NUM_HALF = /\A[0-9]+\z/

  with_options allow_blank: true do
    validates :prefecture_id, numericality: { other_than: 0, message: 'is invalid' }
    validates :zipcode, format: { with: VALID_ZIPCODE_NUM, message: 'is invalid. Input hyphen' }
    validates :phone_number,
              format: { with: VALID_PHONE_HALF, message: 'is invalid. Input only half-width number at most 11 digits long' }
    validates :phone_number, format: { with: VALID_PHONE_MISSING, message: 'is too short' }
    validates :phone_number, format: { with: VALID_NUM_HALF, message: 'is invalid. Input only half-wirth number' }
  end

  # 各テーブルに保存する
  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id) # shipsテーブルの外部キーであるpurhcase_history_idはここで生成し、Shipsテーブルでの保存のため渡す
    Ship.create(zipcode: zipcode, prefecture_id: prefecture_id, locality: locality, address: address,
                building_name: building_name, phone_number: phone_number, purchase_history: purchase_history)
  end
end
