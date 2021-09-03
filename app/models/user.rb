class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_many :items
  #has_many :purchase_histories, dependent: :destroy
  
  with_options allow_blank: true do
    validates :family_name, :given_name, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
    validates :family_name_kana, :given_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"} 
    validates :password, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "is invalid. Input half-width characters include both leters and numbers"}
  end
  with_options presence: true do
    validates :nickname 
    validates :date_of_birth 
    validates :family_name
    validates :given_name 
    validates :family_name_kana 
    validates :given_name_kana 
  end
  validates :email, format:{with: /@/, message:"is invalid. Input @ character" }
end
