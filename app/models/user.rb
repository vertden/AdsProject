class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: [:user, :admin], default: :user


  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
end
