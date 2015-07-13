class MessagesController < ApplicationController

	def create
	  respond_to do |format|
	    if current_user
	      @message = current_user.messages.build(message_params)
	      if @message.save
	        flash.now[:success] = 'Your comment was successfully posted!'
	      else
	        flash.now[:error] = 'Your comment cannot be saved.'
	      end
	      format.html 
	      format.js
	    else
	      format.html 
	      format.js {render nothing: true}
	    end
	  end
	end
	 
	private
	 
	def message_params
	  params.require(:message).permit(:body)
	end

end