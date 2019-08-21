class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :van
  has_many :reviews

  validates :start_date, :end_date, :pax, presence: true
  validates :pax, inclusion: { in: [1, 2, 3, 4] }
end
