class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories, dependent: :destroy

  VALID_HIRAGANA_FULL = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  VALID_KATAKANA_FULL = /\A[ァ-ヶー－]+\z/
  VALID_MULTIPLEX_HALF = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/

  with_options allow_blank: true do
    validates :family_name, :given_name, format: { with: VALID_HIRAGANA_FULL, message: 'is invalid. Input full-width characters' } # /\A[ぁ-んァ-ン一-龥]/だと「メアリー」のような全角ハイフンを含む名前が登録できない
    validates :family_name_kana, :given_name_kana,
              format: { with: VALID_KATAKANA_FULL, message: 'is invalid. Input full-width katakana characters' }
    validates :password,
              format: { with: VALID_MULTIPLEX_HALF,
                        message: 'is invalid. Input half-width characters include both leters and numbers' }
  end
  with_options presence: true do
    validates :nickname
    validates :date_of_birth
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
  end
end
