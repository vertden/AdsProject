class Image < ApplicationRecord
  belongs_to :ad
  #mount_uploader :name, ImageUploader

end
