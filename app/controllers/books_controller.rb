class BooksController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
      @book=Book.new
  end
  def create
  	  @book = Book.new(book_params)
  	  if @book.save
  	  	redirect_to book_path, notice: 'Book was successfully added.'
  	  else
  	  	render new_book_path
  	  end
  end
private
  def book_params
  params.require(:book).permit(:title,:s_no,:author_name,:description)
  end
end
