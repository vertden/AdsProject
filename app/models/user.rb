class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  extend Enumerize

  enumerize :role, in: [:user, :admin], default: :user

  validates :first_name, presence: false, allow_blank: true, length: {minimum: 1}
  validates :second_name, presence: false, allow_blank: true, length: {minimum: 1}



  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
end
