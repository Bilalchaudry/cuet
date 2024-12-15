class Blog < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def self.ransackable_attributes(auth_object = nil)
    ["blog_content", "created_at", "id", "id_value", "photo", "publish", "tag", "title", "updated_at"]
  end
end
