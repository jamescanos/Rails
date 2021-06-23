class ProjectsController < ApplicationController

    before_action :get_id, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        @projects = Project.order(id: :asc).joins(:client).pluck("projects.id, projects.name, clients.name")
        render :json => @projects
    end

    def show
        if @project
            render json: { status: "SUCCESS", message: "Projects List Show", data: @project}, status: :ok
        else
            render json: { status: "ERROR",message: "Project doesn't exists", data: @project.errors}, status: :unprocessable_entity
        end
    end

    def get_id
        @project = Project.find(params[:id])
    end

    def create
        @project = Project.new(project_params)

        if @project.save
           render json: { status: "SUCCESS", message: "New Project Created", data: @project}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Project", data: @project.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @project.update(project_params)
           render json: { status: "SUCCESS", message: "Project Updated", data: @project}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update Project", data: @project.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @projects = Project.all
        @project.destroy
        render json: @projects
    end

    private
    
        def project_params
            params.permit(:name, :client_id)
        end
    
        def record_not_found(error)
            render json: { status: "ERROR", error: error.message,}, status: :not_found
        end

end
