class LanguagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :require_user
  before_filter :find_record, only: [:show, :edit, :update, :destroy]

  def index
    @o_all = get_records(params[:search], params[:page])
  end

  def show
  end

  def new
    @o_single = Language.new
  end

  def create
    @o_single = Language.new(params[:language])
    if @o_single.save
    	create_i18n_file(@o_single.code)
    	redirect_to_index(t("general.successfully_created"))
    else
    	render :action => 'new'	
    end
  end

  def edit
  	render :action => 'new'
  end

  def update
  	create_file = (@o_single.code == params[:language][:code]) ? nil : true
    if @o_single.update_attributes(params[:language])
    	create_i18n_file(@o_single.code) if create_file 
    	redirect_to_index(t("general.successfully_updated"))
    else
    	render :action => 'edit'	
    end
  end

  def destroy
    @o_single.destroy
    @o_all = get_records(params[:search], params[:page])
  end

  private

  def get_records(search, page)
  	Language.search(search).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => page)
  end

  def sort_column
    Language.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def find_record
    begin
      @o_single = Language.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @o_single = nil
    end
  end
  
  def redirect_to_index(msg)
    flash[:notice] = msg
    redirect_to languages_path  	
  end
  
  def create_i18n_file(code)
    @source = File.read(Rails.root.to_s + "/config/locales/en.yml")
    @source = @source.gsub('en', code.to_s)
    directory_file = Rails.root.to_s + "/config/locales/"+code+".yml"
    target = File.open(directory_file, 'w') {|f| f.write(@source) }	
  end

end
