class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category #Item:category = 親:子だが、これはActivehashのせい
  validates :category_id, numericality: { other_than: 0 , messae: "can't be blank"} #"--"の時は保存できない
  
  with_options presence: true do
    validates :category_id

  end
end
