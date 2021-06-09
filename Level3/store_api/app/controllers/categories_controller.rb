class CategoriesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    
    def index
        @categories = Category.all
        render json: { status: "SUCCESS", message: "Categories List", data: @categories}, status: :ok
    end

    def show
        @category = Category.find(params[:id])

        if @category
            render json: { status: "SUCCESS", message: "Categories List Show", data: @category}, status: :ok
        else
            render json: { status: "ERROR", message: "Category doesn't exists", data: @category.errors}, status: :unprocessable_entity
        end
    end

    def create
        
        @category = Category.new(category_params)

        if @category.save
           render json: { status: "SUCCESS", message: "New Category Created", data: @category}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Category", data: @category.errors}, status: :unprocessable_entity
        end

    end

    def update
        
        @category = Category.find(params[:id])

        if @category.update(category_params)
           render json: { status: "SUCCESS", message: "Category Updated", data: @category}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Category", data: @category.errors}, status: :unprocessable_entity
        end

    end

    def destroy

        @categories = Category.all
        @category = Category.find(params[:id])
        @category.destroy
        render json: @categories
        
    end

    private
        def category_params
            params.permit(:name)
        end

        def record_not_found(error)
            render json: { 
                status: "ERROR", 
                error: error.message,
            }, 
                status: :not_found
        end

end
