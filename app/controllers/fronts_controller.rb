class FrontsController < ApplicationController

  before_filter :require_user, :only => [:dashboard, :change_password]
  before_filter :set_header_menu_active
  
  def dashboard
  end

  def forgot_password
		@user = User.new
		if !params[:user].blank?
			if params[:user][:email].blank?
				flash[:forgot_pass_error] = t("general.email_required")
				redirect_to :action => "forgot_password"
			elsif user = authenticate_password(params[:user][:email])
					new_pass = SecureRandom.hex(5)
					user.password = new_pass
					user.password_confirmation = new_pass
					user.save
					body = render_to_string(:partial => "common/forgot_password_mail", :locals => { :username => user.username, :new_pass => new_pass }, :formats => [:html])
					body = body.html_safe
					UserMailer.forgot_password_confirmation(user.email, new_pass, body).deliver
					@user_session = UserSession.find
					if @user_session
						@user_session.destroy
					end
					session[:user_id] = nil
					flash[:notice] = t("general.password_has_been_sent_to_your_email_address")
					redirect_to login_path
			else
				flash[:forgot_pass_error] = t("general.no_user_exists_for_provided_email_address")
				redirect_to :action => "forgot_password"
			end
		end
  end

  def change_password
		if !params[:user].blank?
			if params[:user][:current_password].blank?
				flash[:error_current] = t("general.current_password_required")
				redirect_to :action => "change_password"
			elsif params[:user][:password].blank?
				flash[:error_pass] = t("general.password_required")
				redirect_to :action => "change_password"
			elsif params[:user][:password].to_s != params[:user][:password_confirmation].to_s
				flash[:error_pass] = t("general.password_does_not_match")
				redirect_to :action => "change_password"
			else
				@user = current_user
				if @user.valid_password? params[:user][:current_password]
					@user.password = params[:user][:password]
					@user.password_confirmation = params[:user][:password_confirmation]
					if @user.save
						flash[:notice] = t("general.successfully_updated")
						render :action => :change_password
					else
						flash[:error_pass] = t("general.password_does_not_updated")
						render :action => :change_password
					end
				else
						flash[:error_current] = t("general.current_password_is_wrong")
						render :action => :change_password
				end
			end
		else
			@user = User.new
		end
  end
 
  def other
  	lang = Language.find_by_code(session[:locale])
  	@o_single = lang.pages.where(page_route: params[:page_id]).first
  end

	private
 
  def set_header_menu_active
    @dashboard = true
  end 

end
