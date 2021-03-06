class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions # Item:category = 親:子だが、これはActivehash使用のため
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :prefecture

  # VALID_NUM_HALF = /\A[0-9]+\z/
  VALID_ALPHABET_HALF = / \ A [a-zA-Z] + \ z /
  VALID_COMPLEX_HALF = / \ A [a-zA-Z0-9] + \ z /

  with_options presence: true do
    validates :category_id, :status_id, :prefecture_id, :shipping_fee_id, :shipping_day_id, numericality: { other_than: 0, message: "can't be blank" } # "--"の時は保存できない
    validates :name
    validates :description
    validates :image
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :price, numericality: { with: VALID_ALPHABET_HALF, allow_blank: true, message: 'is invalid. Input half-width number' } # ここはformat:{with:}を使いたいがnumericality:の方が強いためvalidationが効かない。このためnumericality:を使用し以下の3文を同等とする。
  end

  validates :price, numericality: { with: VALID_COMPLEX_HALF, allow_blank: true, message: 'is invalid. Input only number' }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, allow_blank: true, less_than_or_equal_to: 9_999_999,
                            message: 'is out of setting range.Input between ¥300 to ¥9,999,999' }
end
