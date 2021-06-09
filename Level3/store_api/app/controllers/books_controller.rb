class BooksController < ApplicationController

    def index
        #@books = Book.joins(:company, :category)
        @books = Book.all 
        render :json => @books.to_json(:include => [:company, :category])
    end

    def show
        @book = Book.find(params[:id])
        #render json: @company
        if @book
            render json: { status: "SUCCESS", message: "Books List Show", data: @book}, status: :ok
        else
            render json: { status: "ERROR", message: "Book doesn't exists", data: @book.errors}, status: :unprocessable_entity
        end
    end

    def create

        @book = Book.new(book_params)
        
        if @book.save
            render json: { status: "SUCCESS", message: "New Book Created", data: @book}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Book", data: @book.errors}, status: :unprocessable_entity
        end

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
            #params.required(:book).permit(:name, :price, :author, :editor, :description, :company_id, :category_id)
            params.permit(:name, :price, :author, :editor, :description, :company_id, :category_id)
        end

end
