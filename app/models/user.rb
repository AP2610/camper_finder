class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vans
  has_many :bookings

  validates :first_name, :last_name, :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
