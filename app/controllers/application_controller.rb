class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
	layout 'backend'
  before_filter :protect_backend

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
private

  def paginate(items, items_per_page)
    @pn_pages = (items.length / items_per_page.to_f).ceil
    @pn_current = params[:page] != nil ? params[:page].to_i : 1
    
    if @pn_current <= 0 || @pn_current > @pn_pages
      return render  "public/404.html", :status => "404 Not Found"
    else
      from = (@pn_current - 1) * items_per_page
      to = from + items_per_page - 1
      return items[from..to]
    end
  end
  
  def protect_backend
	
		white_list = 
		[
			["frontend", nil],
      ["ymere_changes", nil],
			["tutorials_frontend", nil],
			["news_items_frontend", nil],
			["contact_messages_frontend", nil],
			["backend", "sign_in"],
			["backend", "authenticate"]
		]
		
		white_list.each do |item|
			if params[:controller] == item[0]
				if item[1] != nil
					return if params[:action] == item[1]
				else
					return
				end
			end
		end
	
    return if !session[:administrator_id].blank?
    
		flash[:error] = "#{params[:controller]} - #{params[:action]} - You do not have the permission to view this page, please sign in first"
    redirect_to :controller => 'backend', :action => 'sign_in'
  end
	
end