class RolesController < ApplicationController

    def index
        @roles = Company.all
        render json: { 
            status: "SUCCESS", 
            message: "Roles List", 
            data: @roles
        }, 
        status: :ok
    end

end
