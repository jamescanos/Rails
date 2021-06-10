class PlatformsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    
    def index
        @platforms = Platform.all
        render json: { 
            status: "SUCCESS", 
            message: "Platforms List", 
            data: @platforms
        }, 
            status: :ok
    end

    def show
        @platform = Platform.find(params[:id])

        if @platform
            render json: { 
                status: "SUCCESS", 
                message: "Platforms List Show", 
                data: @platform
            }, 
                status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "Platform doesn't exists", 
                data: @platform.errors
            }, 
                status: :unprocessable_entity
        end
    end

    def create
        
        @platform = Platform.new(platform_params)

        if @platform.save
           render json: { 
               status: "SUCCESS", 
               message: "New Platform Created", 
               data: @platform
            }, 
               status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to save a new Platform", 
                data: @platform.errors
            }, 
                status: :unprocessable_entity
        end

    end

    def update
        
        @platform = Platform.find(params[:id])

        if @platform.update(platform_params)
           render json: { 
               status: "SUCCESS", 
               message: "Platform Updated", 
               data: @platform
            }, 
               status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to update Platform", 
                data: @platform.errors
            }, 
                status: :unprocessable_entity
        end

    end

    def destroy

        @platforms = Platform.all
        @platform = Platform.find(params[:id])
        @platform.destroy
        render json: @platforms
        
    end


    private

        def platform_params
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
