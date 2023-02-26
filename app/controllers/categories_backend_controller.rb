class CategoriesBackendController < ApplicationController
  
  layout 'backend'
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

		if @category.save
			redirect_to "/backend/categories", :notice => 'Category was successfully created.'
		else
			render :action => "new"
		end
  end

  def update
    @category = Category.find(params[:id])

		if @category.update_attributes(params[:category])
			redirect_to "/backend/categories/#{@category.id}/edit", :notice => 'Category was successfully updated.'
		else
			render :action => "edit"
		end
  end

  def destroy
    @category = Category.find(params[:id])
    
    if @category.destroy
      flash[:notice] = 'Category successfully removed'
    else
      flash[:error] = @category.errors.on_base
    end
    
    redirect_to "/backend/categories"
  end
	
end