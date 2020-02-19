class Tractor < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :address, :reward, presence: true

  has_one_attached :photo

end
