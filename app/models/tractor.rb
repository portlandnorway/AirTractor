class Tractor < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :reward, presence: true

  has_one_attached :photo

end
