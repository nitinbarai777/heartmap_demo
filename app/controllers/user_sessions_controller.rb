class UserSessionsController < ApplicationController

  #before_filter :require_user, :except => [:new, :create]
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def index
		redirect_to new_user_session_path
  end
  
  def new
  	unless session[:user_id].nil?
  		redirect_to users_path
  	else
			@user_session = UserSession.new
			respond_to do |format|
				format.html # new.html.erb
				format.xml { render :xml => @user_session }
			end
		end
  end



  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
				session[:user_id] = current_user.id
				role_type_hash = {}
				current_user.roles.each do |r|
					role_type_hash[r.role_type] = r.id 
				end
				session[:user_roles] = role_type_hash
				format.html { redirect_to(dashboard_path, :notice => t("general.login_successful")) }
				format.xml { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    if @user_session
	    @user_session.destroy
	  end
		reset_session
		flash.keep[:notice] = t("general.logout_successful")
    respond_to do |format|
      format.html { redirect_to "/" }
      format.xml { head :ok }
    end
  end
end
