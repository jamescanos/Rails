class RolesController < ApiController

    before_action :authenticate_user!
    before_action :get_id, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @roles = Role.all
        render json: { status: "SUCCESS", message: "Roles List", data: @roles}, status: :ok
    end

    def show
        if @role
            render json: { status: "SUCCESS", message: "Roles List Show", data: @role }, status: :ok
        else
            render json: { status: "ERROR", message: "Role doesn't exists", data: @role.errors}, status: :unprocessable_entity
        end
    end

    def get_id
        @role = Role.find(params[:id])
    end

    def create        
        @role = Role.new(role_params)

        if @role.save
           render json: { status: "SUCCESS", message: "New Role Created", data: @role}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Role", data: @role.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @role.update(role_params)
           render json: { status: "SUCCESS", message: "Role Updated", data: @role}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Role", data: @role.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @roles = Role.all
        @role.destroy
        render json: @roles
    end

    private
    
        def role_params
            params.permit(:name)
        end
    
        def record_not_found(error)
            render json: { status: "ERROR", error: error.message,}, status: :not_found
        end

end
