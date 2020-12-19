class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,:email, :password, presence: true
  validates :email, uniqueness: true
  validates :email, inclusion: { in: ["@"] }
  validates :password, inclusion: { in: %w("a 1") }
  validates :password, length: {minimum:6}
  validates :lastname_kana, :firstname_kana, inclusion: { in: ["カ"]}
end
