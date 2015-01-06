class ArticlesController < ApplicationController
	include ArticlesHelper

	#Displays one blog post at a time
	def show
		@article = Article.find(params[:id])
	end
	#Allows the user to write a new blog post
	def new
		@article = Article.new
	end

	#Creates the new post
	def create
		@article = Article.new(article_params)
		@article.save

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path

	end
end