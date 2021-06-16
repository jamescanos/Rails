class RolesController < ApplicationController

    before_action :get_id, only: [:show, :update, :destroy]

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @roles = Rol.all
        render json: { 
            status: "SUCCESS", 
            message: "Roles List", 
            data: @roles
        }, 
        status: :ok
    end

    def show

        if @rol
            render json: { 
                status: "SUCCESS", 
                message: "Roles List Show", 
                data: @rol
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "Rol doesn't exists", 
                data: @rol.errors
            }, 
            status: :unprocessable_entity
        end
    end

    def get_id
        @rol = Rol.find(params[:id])
    end

    def create
        
        @rol = Rol.new(rol_params)

        if @rol.save
           render json: { 
               status: "SUCCESS", 
               message: "New Rol Created", 
               data: @rol
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to save a new Company", 
                data: @rol.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def update

        if @rol.update(rol_params)
           render json: { 
               status: "SUCCESS", 
               message: "Rol Updated", 
               data: @rol
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to update Company", 
                data: @rol.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def destroy

        @roles = Rol.all
        @rol.destroy
        render json: @roles
        
    end

    private
    
        def rol_params            
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
