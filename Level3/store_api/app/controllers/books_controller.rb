class BooksController < ApplicationController

    include HttpAuthConcern

    #http_basic_authenticate_with name: "admin", password: "1234"

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        #@books = Book.joins(:company, :category)
        @books = Book.all 
        render :json => @books.to_json(:include => [:company, :category])
    end

    def show
        @book = Book.find(params[:id])
        #render json: @company
        if @book
            render json: { 
                status: "SUCCESS", 
                message: "Books List Show", 
                data: @book
            }, 
                status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "Book doesn't exists", 
                data: @book.errors
            }, 
            status: :unprocessable_entity
        end
    end

    def create

        @book = Book.new(book_params)
        
        if @book.save
            render json: { 
                status: "SUCCESS", 
                message: "New Book Created", 
                data: @book
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to save a new Book", 
                data: @book.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def update

        @book = Book.find(params[:id])

        if @book.update(book_params)
            render json: { 
                status: "SUCCESS", 
                message: "Book Updated", 
                data: @book
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to update the Book", 
                data: @book.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def destroy
        @books = Book.all
        @book = Book.find(params[:id])
        @book.destroy

        render json: @books
    end

    private

        def book_params                
            params.permit(:name, :price, :author, :editor, :description, :company_id, :category_id)
        end

        def record_not_found(error)
            render json: { 
                status: "ERROR", 
                error: error.message,
            }, 
                status: :not_found
        end

end
