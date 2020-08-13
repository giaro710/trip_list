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

  # PgSearch
  include PgSearch::Model

  pg_search_scope :search_by_trip_name_and_destination,
    against: [
      [:name, 'A'],
      [:destination, 'B']
    ],
    using: {
      tsearch: { prefix: true }
    }
end
