class Item < ApplicationRecord
  belongs_to :list

  validates :name, presence: true
  validates :quantity, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
end
