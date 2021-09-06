class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee, :shipping_day, :prefecture,  #Item:category = 親:子だが、これはActivehashのせい
  validates :category_id, :status_id, :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"} #"--"の時は保存できない
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "Price is out of range. Input between ¥300 to ¥9,999,999"},
    format: { with: /\A[0-9]+\z/, }
  end

end
