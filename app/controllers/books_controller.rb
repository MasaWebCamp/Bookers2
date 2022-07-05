class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
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
      @books = Book.all
      format.html {render :edit}
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
    params.required(:book).permit(:title, :body)
  end
end