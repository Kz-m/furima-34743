class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories
  
  with_options allow_blank: true do
    validates :family_name, :given_name, format:{with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters"}
    validates :family_name_kana, :given_name_kana, format:{with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters"} 
    validates :password,:password_confirmation, length:{minimum:6}, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "is invalid. Include both leters and numbers"}
  end
  validates :nickname, :date_of_birth, :family_name, :given_name, :family_name_kana, :given_name_kana, :password_confirmation, presence: true 
  validates :password, confirmation: true

  #it 'pw confirmation doesnt match pw' do
  #  user = build(:user, password_confirmation: 'bbbbbb')
  #  user.valid?
  #  ecxcept(user.errors[:password_confirmation]).to include("doesn't match pw")
  #end


end