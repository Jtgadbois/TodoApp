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


	private

	def list_params
		params.require(:list).permit(:name, :description)
	end

end