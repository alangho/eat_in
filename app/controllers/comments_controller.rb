class CommentsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def create
    respond_to do |format|
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          flash.now[:success] = 'Your comment was successfully posted!'
        else
          flash.now[:error] = 'Your comment cannot be saved.'
        end
        format.html {redirect_to root_url}
        format.js
      else
        format.html {redirect_to root_url}
        format.js {render nothing: true}
      end
    end
  end

private
 
def comment_params
  params.require(:comment).permit(:body, :micropost_id)
end

end