class NewsItemsFrontendController < ApplicationController

  layout 'frontend'

  def index
    @news_items = paginate(NewsItem.all, 4)
  end

  def show
    @news_item = NewsItem.find_by_url_friendly(params[:id])
  end

end
