class TutorialsFrontendController < ApplicationController
	
	layout 'frontend'
	
	def index
    @tutorials = Tutorial.find(:all, :conditions => "live = 't'", :order => "created_at DESC")
    @tutorials = paginate(@tutorials, 4)
	end
	
	def show
  
		@tutorial = Tutorial.find_by_url_friendly(params[:id])
    
    if @tutorial == nil || (!@tutorial.live && session[:administrator_id] == nil)
      return render  "public/404.html", :status => "404 Not Found"
    end
	end

end
