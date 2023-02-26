class ContactMessagesFrontendController < ApplicationController

	layout 'frontend'

	def new
		@contact_message = ContactMessage.new
	end	
	
  def create
    @contact_message = ContactMessage.new(params[:contact_message])

		if @contact_message.save
			flash[:notice] = 'Contact message was successfully created.'
			redirect_to(:action => "new")
		else
			render :action => "contact"
		end
  end

end