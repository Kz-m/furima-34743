class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories

  with_options presence: true do
    validates :nickname 
    validates :family_name, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :given_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"} 
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"} 
    validates :given_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Namekana kana Full-width katakana characters"}
    validates :date_of_birth 
    validates :encrypted_password, length:{minimum:7}, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
    validates :email
    
  end
  
end
