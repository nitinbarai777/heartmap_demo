class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.validate_email_field = false
    c.login_field = 'username'
  end
  
	validates_uniqueness_of :username
	validates :email, :presence => true
	
	

	has_many :user_roles
	has_many :roles, :through => :user_roles
	
  def is_provider_nil?
		#User.where(User.arel_table[:username].not_eq(self.username))
		usr_check = User.where("email = ? and provider IS NULL", self.email).first
  end

  def self.search(search)
    if search
      where('((username LIKE ? OR email LIKE ? OR contact LIKE ?) AND is_admin != ?)', "%#{search}%", "%#{search}%", "%#{search}%", 1)
    else
      #where('is_admin != 1')
      scoped
    end
  end

	def user_name
		return self.first_name.blank? ? self.username : (self.first_name.to_s + " " + self.last_name.to_s)
	end
	
  def has_role?(role)
    self.user_role.role.role_type == role
  end
  
  def is_super_admin?
    has_role?("SuperAdmin")
  end
  
  def is_user?
    has_role?("User")
  end
  	
end
