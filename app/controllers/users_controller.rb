class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :require_user
  before_filter :set_header_menu_active
  before_filter :find_record, only: [:show, :edit, :update, :destroy]

  def index
    @o_all = get_records(params[:search], params[:user])
  end

  def show
  end

  def new
    @o_single = User.new
  end

  def create
    @o_single = User.new(params[:user])

    if @o_single.save
	    if params[:role_ids]
	  		user_roles = Role.find(params[:role_ids])
	  		@o_single.roles << user_roles
	  	end    	
		  body = render_to_string(:partial => "common/registration_mail", :locals => { :username => @o_single.username, :password => params[:password] }, :formats => [:html])
		  body = body.html_safe
		  UserMailer.registration_confirmation(@o_single.email, body).deliver    	
    	redirect_to_index(t("general.successfully_created"))
    else
    	render :action => 'new'		
    end
  end

  def edit
  	render :action => 'new'
  end

  def update
    if @o_single.update_attributes(params[:user]) 
	    if params[:role_ids]
	  		user_roles = Role.find(params[:role_ids])
	  		@o_single.roles.delete_all
	  		@o_single.roles << user_roles
	  	end    	
    	redirect_to_index(t("general.successfully_updated"))
    else
    	render :action => 'new'
    end
  end

  def destroy
    @o_single.destroy
    @o_all = get_records(params[:search], params[:page])
  end

  private

  def get_records(search, page)
  	User.search(search).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def find_record
    begin
      @o_single = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @o_single = nil
    end
  end

  def set_header_menu_active
    @users = true
  end
  
  def redirect_to_index(msg)
    flash[:notice] = msg
    redirect_to users_path  	
  end

end
