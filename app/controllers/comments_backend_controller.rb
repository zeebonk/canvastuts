class CommentsBackendController < ApplicationController
	
	layout 'backend'

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

		redirect_to "/backend/comments", :notice => "Comment succesfully removed"
  end
	
end
