class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, #Item:category = 親:子だが、これはActivehashのせい
  validates :category_id, :status_id, numericality: { other_than: 0 , messae: "can't be blank"} #"--"の時は保存できない
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id

  end
end
