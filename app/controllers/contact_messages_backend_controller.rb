class ContactMessagesBackendController < ApplicationController

	layout 'backend'

  def index
    @contact_messages = ContactMessage.all
  end

  def show
    @contact_message = ContactMessage.find(params[:id])
  end

  def destroy
    @contact_message = ContactMessage.find(params[:id])
    @contact_message.destroy
		flash[:notice] = "Succesfully deleted contact_message"
		redirect_to :action => 'index'
  end
	
end