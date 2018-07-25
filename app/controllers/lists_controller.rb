class ListsController < ApplicationController

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		if @list.save
			flash[:notice] = "List was created successfully"
			redirect_to list_path(@list)
		else
		 render 'new'
		end
	end

	def show
		@list = List.find(params[:id]) 
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])
		if @list.update(list_params)
			flash[:notice] = "Todo was successfully updated"
			redirect_to list_path(@list)
		else
		 render 'edit'
		end
	end

	def index
		@lists = List.all
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		flash[:notice] = "Todo was deleted successfully"
		redirect_to lists_path
	end

	private

	def list_params
		params.require(:list).permit(:name, :description)
	end

end