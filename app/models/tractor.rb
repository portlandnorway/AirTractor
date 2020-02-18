class Tractor < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :address, :reward, :user_id, presence: true

  has_one_attached :photo

end
