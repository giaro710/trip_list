class List < ApplicationRecord
  belongs_to :trip

  validates :title, presence: true
end
