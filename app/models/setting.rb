class Setting < ActiveRecord::Base
  # attr_accessible :title, :body
  mount_uploader :logo, ImageUploader
end
