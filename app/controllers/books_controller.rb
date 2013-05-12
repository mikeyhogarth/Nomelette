class BooksController < ApplicationController

  	def index
		@books = Book.find(:all, :order => "title ASC")
	end

	def show
		@book = Book.find(params[:id], :include => :recipes)
		@books = Book.find(:all)
	end
end
