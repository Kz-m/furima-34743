class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories, dependent: :destroy
  
  with_options allow_blank: true do
    validates :family_name, :given_name, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
    validates :family_name_kana, :given_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"} 
    validates :password, length:{minimum:6}, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "is invalid. Include both leters and numbers"}
  end
  validates :nickname, :date_of_birth, :family_name, :given_name, :family_name_kana, :given_name_kana, presence: true 

end