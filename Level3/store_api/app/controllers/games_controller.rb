class GamesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    
    def index
        @games = Game.all 
    end

    def show
        @game = Game.find(params[:id])
        #render json: @company
        if @game
            render json: { status: "SUCCESS", message: "Games List Show", data: @game}, status: :ok
        else
            render json: { status: "ERROR", message: "Game doesn't exists", data: @game.errors}, status: :unprocessable_entity
        end
    end

    def create

        @game = Game.new(game_params)
        
        if @game.save
            render json: { status: "SUCCESS", message: "New Game Created", data: @game}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to save a new Game", data: @game.errors}, status: :unprocessable_entity
        end

    end

    def update

        @game = Game.find(params[:id])

        if @game.update(game_params)
            render json: { status: "SUCCESS", message: "Game Updated", data: @game}, status: :ok
        else
            render json: { status: "ERROR", message: "You were enable to update the Game", data: @game.errors}, status: :unprocessable_entity
        end

    end

    def destroy
        @games = Game.all
        @game = Game.find(params[:id])
        @game.destroy

        render json: @games
    end

    private

        def game_params                            
            params.permit(:name, :price, :description, :company_id, :platform_id)
        end

        def record_not_found(error)
            render json: { 
                status: "ERROR", 
                error: error.message,
            }, 
                status: :not_found
        end

end
