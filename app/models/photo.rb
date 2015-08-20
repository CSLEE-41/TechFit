class Photo < ActiveRecord::Base
  belongs_to :user

  mount_uploader :photo_img, PhotoImgUploader
end
