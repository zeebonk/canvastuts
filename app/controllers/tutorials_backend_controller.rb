class TutorialsBackendController < ApplicationController

	layout 'backend'

  def index
    @tutorials = Tutorial.all
  end

  def new
    @tutorial = Tutorial.new
  end

  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
    @tutorial = Tutorial.new(params[:tutorial])
		@tutorial.administrator_id = session[:administrator_id]
		
		if @tutorial.save
			redirect_to "/backend/tutorials", :notice => 'Tutorial was successfully created.'
		else
			render :action => "new"
		end
  end

  def update
    @tutorial = Tutorial.find(params[:id])
		
		if @tutorial.update_attributes(params[:tutorial])
			redirect_to "/backend/tutorials/#{@tutorial.id}/edit", :notice => 'Tutorial was successfully updated.'
		else
			render :action => "edit"
		end
  end

  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy

		redirect_to "/backend/tutorials", :notice => 'Tutorial was successfully removed.'
  end
	
end