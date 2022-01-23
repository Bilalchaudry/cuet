class SlideImage < ApplicationRecord
  mount_uploader :image, PhotoUploader
end
