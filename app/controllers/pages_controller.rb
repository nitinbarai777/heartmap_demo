class PagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :require_user
  before_filter :find_record, only: [:show, :edit, :update, :destroy]

  def index
    @o_all = get_records(params[:search], params[:page])
  end

  def show
  end

  def new
    @o_single = Page.new
  end

  def create
    @o_single = Page.new(params[:page]) 
    @o_single.save ? (redirect_to_index(t("general.successfully_created"))) : (render :action => 'new')
  end

  def edit
  	render :action => 'new'
  end

  def update
    @o_single.update_attributes(params[:page]) ? (redirect_to_index(t("general.successfully_updated"))) : (render :action => 'edit')
  end

  def destroy
    @o_single.destroy
    @o_all = get_records(params[:search], params[:page])
  end

  private

  def get_records(search, page)
  	Page.search(search).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
  end

  def sort_column
    Page.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def find_record
    begin
      @o_single = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @o_single = nil
    end
  end
  
  def redirect_to_index(msg)
    flash[:notice] = msg
    redirect_to pages_path  	
  end

end
