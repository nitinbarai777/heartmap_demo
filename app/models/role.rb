class Role < ActiveRecord::Base

	SUPER_ADMIN = "SuperAdmin"
	EDUCATOR = "Educator"
	AGENT = "Agent"
	EXPERT = "Expert"
		
  has_many :user_roles
  has_many :users, :through => :user_roles  
  
  validates_presence_of :role_type
  validates_uniqueness_of :role_type
  def self.search(search)
    search ? (where('role_type LIKE ?', "%#{search}%")) : scoped
  end
  
  def self.system_users
  	userRole = [SUPER_ADMIN, EDUCATOR, AGENT, EXPERT].to_a
  	where("role_type IN (?)", userRole)
  end  
end