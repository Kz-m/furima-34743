class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :shipping_fee, :shipping_day, :prefecture,  #Item:category = 親:子だが、これはActivehashのせい
  validates :category_id, :status_id, :prefecture_id, numericality: { other_than: 0 , messae: "can't be blank"} #"--"の時は保存できない
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :prefecture_id
    validates :price


  end
end
