class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tractor

  validates :tractor_id, :user_id, presence: true
end
