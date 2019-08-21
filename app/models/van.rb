class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :title, :address, :price_cents, presence: true
  validates :pax, inclusion: { in: [1, 2, 3, 4] }

  mount_uploader :photo, PhotoUploader
end
