class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :tractors

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true


  has_one_attached :photo

end
