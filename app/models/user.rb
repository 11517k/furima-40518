class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birth_date, :first_name, :last_name, :first_name_kana, :last_name_kana, presence: true

  # 全角のバリデーション
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }

  # カタカナのバリデーション
  validates :first_name_kana, :last_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }

  # パスワードのバリデーション
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
end
