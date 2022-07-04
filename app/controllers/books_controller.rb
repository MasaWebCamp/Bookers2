class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    respond_to do |format|
    if @book.save
      format.html {redirect_to @book, notice: 'Book was successfully created.'}
      format.json {render :show, status: :created, location: @book}
    else
      format.html {render :index}
    end
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    respond_to do |format|
    if @book.update(book_params)
      format.html {redirect_to @book, notice: 'Book was successfully updated.'}
      format.json {render :show, status: :updated, location: @book}
    else
      format html {render :edit}
    end
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
