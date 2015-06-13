class CommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html
        format.json
      else
        format.html
        format.json
      end
      format.js
    end
  end

  private
   
  def comment_params
    params.require(:comment).permit(:body, :micropost_id)
  end

end