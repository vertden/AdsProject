class Ad < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :images, dependent: :destroy

  extend Enumerize
  enumerize :status, in: [:draft, :new]

  accepts_nested_attributes_for :images, :allow_destroy => true

  validates :body, presence: true, length: {minimum: 5,maximum: 1000}
  validates :status, presence: true

end
