class ClientsController < ApplicationController

    before_action :get_id, only: [:show, :update, :destroy]

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
        #@clients = Client.select('id, name, company_id')
        @clients = Client.order(id: :asc).joins(:company).pluck("clients.id, clients.name, companies.name")
        render :json => @clients
    end

    def show

        if @client
            render json: { 
                status: "SUCCESS", 
                message: "Clients List Show", 
                data: @client
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "Client doesn't exists", 
                data: @client.errors
            }, 
            status: :unprocessable_entity
        end
    end

    def get_id
        @client = Client.find(params[:id])
    end

    def create
        
        @client = Client.new(client_params)

        if @client.save
           render json: { 
               status: "SUCCESS", 
               message: "New Client Created", 
               data: @client
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to save a new Client", 
                data: @client.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def update

        if @client.update(client_params)
           render json: { 
               status: "SUCCESS", 
               message: "Client Updated", 
               data: @client
            }, 
            status: :ok
        else
            render json: { 
                status: "ERROR", 
                message: "You were enable to update Client", 
                data: @client.errors
            }, 
            status: :unprocessable_entity
        end

    end

    def destroy

        @clients = Client.all
        @client.destroy
        render json: @clients
        
    end


    private
    
        def client_params
            params.permit(:name, :company_id)
        end
    
        def record_not_found(error)
            render json: { 
                status: "ERROR", 
                error: error.message,
            }, 
                status: :not_found
        end

end
