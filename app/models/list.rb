class List < ApplicationRecord
  belongs_to :trip

  has_many :items, dependent: :destroy

  validates :title, presence: true
end
