module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def get_all_pages
  	if session[:locale].nil?
  		Page.all
  	else
  		lang = Language.find_by_code(session[:locale])
  		if lang
  			lang.pages
  		else
  			[]	
  		end
  	end	
  end
  
  def default_locales
    return Language.all.collect {|p| [ p.name, p.code ] }
  end
end
