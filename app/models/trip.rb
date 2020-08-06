class Trip < ApplicationRecord
  # Associations
  belongs_to :user

  has_many :lists, dependent: :destroy

  #Validations
  validates :name, :destination,:start_date, :end_date, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 1..20 }

  # Geocoding
  geocoded_by :destination
  after_validation :geocode, if: :will_save_change_to_destination?
end
