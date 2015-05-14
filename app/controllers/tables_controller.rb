class TablesController < ApplicationController

	def search
	end

	def index
  	@tables = Table.search(params[:search], params[:region])
	end

  def tables

  end

  def show
  	@user = User.find(params[:id])
  	@table = Table.find(params[:id])
  end

end