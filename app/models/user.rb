class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んーァ-ヶー-龥々]+\z/ }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
end
