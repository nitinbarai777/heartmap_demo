class Page < ActiveRecord::Base
  belongs_to :language
  validates :name, :presence => true
  validates :page_route, :presence => true
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
