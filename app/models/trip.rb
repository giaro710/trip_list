class Trip < ApplicationRecord
  belongs_to :user

  validates :name, :destination, :date, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 1..20 }
end
