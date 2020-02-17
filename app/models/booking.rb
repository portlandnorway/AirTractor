class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tractor
end
