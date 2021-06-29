class EmployeesController < ApiController    

    before_action :authenticate_user!
    before_action :get_id, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @employees = Employee.all 
        render :json => @employees.to_json(:include => [:company, :role, :country, :project])
    end

    def show
        if @employee
            render json: { status: "SUCCESS", message: "EMployees List Show", data: @employee}, status: :ok
        else
            render json: { status: "ERROR", message: "Employee doesn't exists", data: @employee.errors}, status: :unprocessable_entity
        end
    end

    def get_id
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.save
           render json: { status: "SUCCESS", message: "New Employee Created", data: @employee}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Employee", data: @employee.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @employee.update(employee_params)
           render json: { 
               status: "SUCCESS", message: "Employee Updated", data: @employee}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Employee", data: @employee.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @employees = Employee.all
        @employee.destroy
        render json: @employees
    end


    private
    
        def employee_params
            params.permit(:name, :company_id, :role_id, :country_id, :project_id)
        end
    
        def record_not_found(error)
            render json: { status: "ERROR", error: error.message,}, status: :not_found
        end

end
