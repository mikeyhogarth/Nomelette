class Admin::BooksController < ApplicationController
  before_filter :admin_only!

  # GET /admin/books
  # GET /admin/books.json
  def index
    @books = Book.all
  end

  # GET /admin/books/1
  # GET /admin/books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /admin/books/new
  # GET /admin/books/new.json
  def new
    @book = Book.new
  end

  # GET /admin/books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /admin/books
  # POST /admin/books.json
  def create
    @book = Book.new(params[:book])

    if @book.save
      redirect_to [:admin,@book], notice: 'Book was successfully created.' 
    else
      render action: "new"
    end
  end

  # PUT /admin/books/1
  # PUT /admin/books/1.json
  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to [:admin,@book], notice: 'Book was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /admin/books/1
  # DELETE /admin/books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_url   
  end
end
