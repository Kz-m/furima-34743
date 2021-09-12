class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions #Item:category = 親:子だが、これはActivehash使用のため
  belongs_to_active_hash :Category
  belongs_to_active_hash :Status
  belongs_to_active_hash :ShippingFee
  belongs_to_active_hash :ShippingDay
  belongs_to_active_hash :Prefecture

  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :category_id, :status_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, numericality:{ other_than: 0 , message: "can't be blank"} #"--"の時は保存できない
  
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :price, numericality:{ with: VALID_PRICEL_HALF, message: "is invalid. Input half-width number"} #ここはformat:{with:}を使いたいがnumericality:の方が強いためvalidationが効かない。このためumericality:を使用し以下の2文を同等とする。
  end
  validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "is out of setting range.Input between ¥300 to ¥9,999,999"}
 
end 
