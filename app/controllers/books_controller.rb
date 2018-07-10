class BooksController < ApplicationController
  def borrow
    @book=Book.find(params[:id])
    @book.is_borrowed = true
    @book.user_id = session[:user_id]
    @book.save
      redirect_to @book, notice: 'Book was successfully borrowed.'
  end
  
  def return
  	@book=Book.find(params[:id])
  	invalid_return = false
  	if @book.is_borrowed && (@book.user_id != current_user.id)
      invalid_return = true
  	end
  	@book.is_borrowed = false
    @book.user_id = nil
    if !invalid_return && @book.save!
      redirect_to @book, notice: 'Book was successfully returned.'
    else
      render :show, notice:  "Invalid Action!"
    end	
  end

  def index
    @books=Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book=Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
  	@book = Book.new(book_params)
  	if @book.save
  	  redirect_to @book, notice: 'Book was successfully added.'
  	else
  	  render new_book_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.' 
    else
      render 'edit'
    end	
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
      redirect_to @book, notice: 'Book was successfully deleted.'
  	
  end

 private
  
  def book_params
    params.require(:book).permit(:title,:s_no,:author_name,:description,:is_borrowed) 
  end
end
