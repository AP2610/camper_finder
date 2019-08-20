class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :title, :address, :price_cents, presence: true
end
