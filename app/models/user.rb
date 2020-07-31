class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :photo

  validates :first_name, length: { in: 1..30 }
  validates :last_name, length: { in: 1..30 }
end
