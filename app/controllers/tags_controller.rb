class TagsController < ApplicationController
	def show
		@tag = Tag.find(params[:id])
	end

	def index
		render 'index'
	end
end
