class User < ApplicationRecord
  has_many :ads
  mount_uploader :avatar, ImageUploader
  extend Enumerize
  enumerize :role, in: [:guest,:user, :admin], default: :user


  validates :first_name, presence: false, allow_blank: true, length: {minimum: 1}
  validates :second_name, presence: false, allow_blank: true, length: {minimum: 1}



  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
end
