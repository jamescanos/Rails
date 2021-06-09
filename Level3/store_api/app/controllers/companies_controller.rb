class CompaniesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @companies = Company.all
        render json: { status: "SUCCESS", message: "Companies List", data: @companies}, status: :ok
    end

    def show
        @company = Company.find(params[:id])

        if @company
            render json: { status: "SUCCESS", message: "Companies List Show", data: @company}, status: :ok
        else
            render json: { status: "ERROR", message: "Company doesn't exists", data: @company.errors}, status: :unprocessable_entity
        end
    end

    def create
        
        @company = Company.new(company_params)

        if @company.save
           render json: { status: "SUCCESS", message: "New Company Created", data: @company}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Company", data: @company.errors}, status: :unprocessable_entity
        end

    end

    def update
        
        @company = Company.find(params[:id])

        if @company.update(company_params)
           render json: { status: "SUCCESS", message: "Company Updated", data: @company}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Company", data: @company.errors}, status: :unprocessable_entity
        end

    end

    def destroy

        @companies = Company.all
        @company = Company.find(params[:id])
        @company.destroy
        render json: @companies
        
    end


    private
    
        def company_params
            #params.require(:company).permit(:name)
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
