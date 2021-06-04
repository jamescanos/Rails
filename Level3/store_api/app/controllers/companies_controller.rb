class CompaniesController < ApplicationController

    def index
        @companies = Company.all
        #render json: @companies
        render json: { status: "SUCCESS", message: "Companies List", data: @companies}, status: :ok
    end

    def show
        @company = Company.find(params[:id])
        #render json: @company
        render json: { status: "SUCCESS", message: "Companies List", data: @company}, status: :ok
    end

    def create
        
        @company = Company.new(company_params)

        #@company = Company.new(
        #    name: params[:name]
        #)
        #render json: { status: "SUCCESS", message: "New Company Created", data: @company}, status: :ok
        if @company.save
           render json: { status: "SUCCESS", message: "New Company Created", data: @company}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Company", data: @company.errors}, status: :unprocessable_entity
        end

    end

    private
        def company_params
            #puts "Params: #{params[:name]}"
            #params.require(:company).permit(:name)
            params.permit(:name)
        end

end
