class BooksController < ApplicationController
  
  def index
    @books = Book.joins(:company)
    #@booksjoin = Book.includes(:companies, :platform)
  end
  
  def new
    @book = Book.new
  end

  def create

    @book = Book.new(book_params)
    
    if @book.save
      redirect_to books_path
    else
      render :new
    end

  end

  def edit

    @book = Book.find(params[:id])

  end

  def update

    @book = Book.find(params[:id])
    puts @book 
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end

  end

  def destroy

    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path

  end

  private

    def book_params                
      params.required(:book).permit(:name, :price, :author, :editor, :description, :company_id)
      #params.required(:game).permit(:name, :price, :description, :company_id)
    end

end
