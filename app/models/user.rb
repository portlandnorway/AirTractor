class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :tractors, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true


  has_one_attached :avatar

end
