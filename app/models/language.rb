class Language < ActiveRecord::Base
	has_many :pages, :dependent => :destroy
	
	validates :name, :presence => true
	validates :code, :presence => true
	mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
