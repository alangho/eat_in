class TablesController < ApplicationController

	def search
	end

	def index
    @tables = Table.paginate(page: params[:page], per_page: 48)
    if params[:search] || params[:region] 
  	 @tables = Table.paginate(page: params[:page], per_page: 48).search(params[:search], params[:region])
    end
    respond_to do |format|
      format.html
      format.js
    end
	end

  def tables

  end

  def show
  	@user = User.find(params[:id])
  	@table = Table.find(params[:id])
  end

end