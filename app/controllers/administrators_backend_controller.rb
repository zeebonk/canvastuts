class AdministratorsBackendController < ApplicationController

  def index
    @administrators = Administrator.all
  end

  def new
    @administrator = Administrator.new
  end

  def edit
    @administrator = Administrator.find(params[:id])
		@administrator.password = ""
  end

  def create
    @administrator = Administrator.new(params[:administrator])

		if @administrator.save
			redirect_to "/backend/administrators", :notice => 'Administrator was successfully created.'
		else
			render :action => "new"
		end
  end

  def update
    @administrator = Administrator.find(params[:id])
			
		if @administrator.update_attributes(params[:administrator])
			redirect_to "/backend/administrators/#{@administrator.id}/edit", :notice => 'Administrator was successfully updated.'
		else
			render :action => "edit"
		end
  end
	
  def change_password
    @administrator = Administrator.find(params[:id])
    @administrator.password = ""
  end
  
  def update_password
    @administrator = Administrator.find(params[:id])
    
    if @administrator.update_attributes(params[:administrator])
			redirect_to "/backend/administrators/#{@administrator.id}/change_password", :notice => 'Administrator password was successfully updated.'
    else
      @administrator.password_confirmation = ""
      @administrator.password = ""
      render :action => "change_password"
    end
  end

  def destroy
    @administrator = Administrator.find(params[:id])
    @administrator.destroy

		redirect_to "/backend/administrators", :notice => "Administrator successfully removed"
  end
	
end