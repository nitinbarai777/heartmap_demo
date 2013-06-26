class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :is_admin?, :is_educator?, :is_agent?, :is_expert?
  before_filter :set_locale
  before_filter :default_settings

	SUPER_ADMIN = "SuperAdmin"
	EDUCATOR = "Educator"
	AGENT = "Agent"
	EXPERT = "Expert"
	
  def set_locale
    # if this is nil then I18n.default_locale will be used
		if params[:locale]
			session[:locale] = params[:locale]
		elsif session[:locale].nil? or session[:locale].blank? 
			session[:locale] = I18n.default_locale
		end
  end
  
  def default_settings
    begin
      @o_settings = Setting.find(1)
    rescue ActiveRecord::RecordNotFound => e
      @o_settings = nil
    end
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
		@current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      redirect_to :controller => "user_sessions", :action => "new"
    end
  end
 
  def authenticate_password(email)
    user_exists = User.exists?(email: email)
    if user_exists
			user = User.find_by_email(email)
			return user
	  end
	  return false
  end
  
  def authenticate_change_password(password)
      user_exists = User.exists?(password: password)
      if user_exists
		user = User.find_by_password(password)
		return user
	  end
	  return false
  end

	def is_admin?
		session[:user_roles][SUPER_ADMIN]
	end
	
  def is_educator?
	 session[:user_roles][EDUCATOR] 
  end
  
  def is_agent?
	 session[:user_roles][AGENT] 
  end
  
  def is_expert?
	 session[:user_roles][EXPERT] 
  end	
	
end
