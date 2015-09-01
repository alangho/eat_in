class CommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

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

  def destroy
    @comment.destroy
    redirect_to request.referrer || root_url
  end

  private
   
    def comment_params
      params.require(:comment).permit(:body, :micropost_id, :picture)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end

end