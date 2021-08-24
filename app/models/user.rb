class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase_histories
  
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :given_name, presence: true
  validates :family_name_kana, presence: true
  validates :given_name_kana, presence: true
  validates :date_of_birth, presence: true

end
