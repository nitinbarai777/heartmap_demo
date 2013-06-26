class SettingsController < ApplicationController
  before_filter :require_user
  before_filter :find_record, only: [:new, :create, :update]
  
  def new
  end

  def create
    if @o_single.update_attributes(params[:setting])
			flash[:notice] = t("general.successfully_updated")
    end
    render :action => 'new'
  end
  
  def update
    if @o_single.update_attributes(params[:setting])
			flash[:notice] = t("general.successfully_updated")
    end
    render :action => 'new'
  end  
  
  private
  
  def find_record
    begin
      @o_single = Setting.find(1)
    rescue ActiveRecord::RecordNotFound => e
      @o_single = Setting.new
    end
  end  

end
