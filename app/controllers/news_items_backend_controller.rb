class NewsItemsBackendController < ApplicationController

  layout 'backend'

  def index
    @news_items = NewsItem.all
  end

  def new
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def create
    @news_item = NewsItem.new(params[:news_item])
    @news_item.administrator_id = session[:administrator_id];
    
    if @news_item.save
      redirect_to "/backend/news_items", :notice => 'News item was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @news_item = NewsItem.find(params[:id])

    if @news_item.update_attributes(params[:news_item])
      redirect_to "/backend/news_items/#{@news_item.id}/edit", :notice => 'News item was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy

    redirect_to "/backend/news_items", :notice => 'News item was successfully removed.'
  end
  
end