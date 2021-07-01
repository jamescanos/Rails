class CountriesController < ApiController

    before_action :authenticate_user!
    before_action :get_id, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @countries = Country.all
        @countries = Kaminari.paginate_array(@countries).page(params[:page]).per(5)
        render json: { status: "SUCCESS", message: "Countries List", data: @countries}, 
        status: :ok
    end

    def show
        if @country
            render json: { status: "SUCCESS", message: "Countries List Show", data: @country}, status: :ok
        else
            render json: { status: "ERROR", message: "Country doesn't exists", data: @country.errors}, status: :unprocessable_entity
        end
    end

    def get_id
        @country = Country.find(params[:id])
    end

    def create
        @country = Country.new(country_params)

        if @country.save
           render json: { status: "SUCCESS", message: "New Country Created", data: @country},status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Country", data: @country.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @country.update(country_params)
           render json: { status: "SUCCESS",message: "Country Updated", data: @country}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Country", data: @country.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @countries = Country.all
        @country.destroy
        render json: @countries
    end

    private
    
        def country_params
            params.permit(:name)
        end
    
        def record_not_found(error)
            render json: { status: "ERROR", error: error.message,}, status: :not_found
        end
        
end
