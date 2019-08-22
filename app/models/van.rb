class Van < ApplicationRecord
  # searchkick

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :title, :address, :price_cents, presence: true

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  monetize :price_cents

  include PgSearch::Model

  pg_search_scope :search_by_address,
                  against: :address,
                  using: {
                    tsearch: { prefix: true }
                  }

  validate :check_geocode

  private

  def check_geocode
    self.geocode
    unless (self.latitude)
      self.errors[:geo] << "incorrect address"
    end
  end
end
