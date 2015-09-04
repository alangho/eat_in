class TablesController < ApplicationController

  has_scope :cuisine
  has_scope :keywords

  def create
    @table = Table.new(table_params)
    @table.user = current_user
    @table.cuisine = params[:cuisine]
    if @table.save
      redirect_to @table
    else
      render 'new'
    end
  end

	def search
	end

	def index
    @tables = apply_scopes(Table).all.paginate(page: params[:page], per_page: 48)
    
    respond_to do |format|
      format.html
      format.js
    end
	end

  def new
    @table = Table.new
  end

  def destroy
    Table.find(params[:id]).destroy
    flash[:success] = "Table sucessfully cleaned"
    redirect_to root_url
  end

  def tables

  end

  def show
  	@table = Table.find(params[:id])
    @user = User.find(@table.user.id)
    @message = Message.new
    @messages = Message.order('created_at DESC')
  end

  private

    def table_params
      params.require(:table).permit(:title, :cuisine)
    end

end