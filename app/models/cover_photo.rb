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
end
