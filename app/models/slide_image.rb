class SlideImage < ApplicationRecord
  mount_uploader :image, PhotoUploader

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "image", "publish", "updated_at"]
  end
end
