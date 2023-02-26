class FrontendController < ApplicationController
	
	layout 'frontend'
	
	def index
	  @tutorials = Tutorial.find(:all, :conditions => "live = 't'", :order => "created_at DESC")
		#@tutorials = @tutorials[0..2] if @tutorials.length > 3
	  @tutorials = paginate(@tutorials, 8)
	end
	
end
