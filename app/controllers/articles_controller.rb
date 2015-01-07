class ArticlesController < ApplicationController
	include ArticlesHelper

	#Displays one blog post at a time
	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
	end
	#Allows the user to write a new blog post
	def new
		@article = Article.new
	end

	#Creates the new post
	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title} was added!"

		redirect_to article_path(@article)
	end

	#Deletes the article
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	#Edits the article
	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to articles_path(@article)
	end
end