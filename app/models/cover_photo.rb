class CoverPhoto < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  before_create do
    if self.publish == true
      CoverPhoto.update_all(publish: false)
    end
  end

  before_create do
    if self.publish == true
      CoverPhoto.update_all(publish: false)
    end
  end

  before_update do
    if self.publish == true
      CoverPhoto.update_all(publish: false)
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "photo", "publish", "updated_at"]
  end
end
