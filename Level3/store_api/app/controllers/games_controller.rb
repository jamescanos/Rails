class GamesController < ApplicationController

    def index
        #@games = Game.joins(:company, :platform)
        @games = Game.all 
        render :json => @games.to_json(:include => [:company, :platform])
        #render json: { 
        #    status: "SUCCESS",
        #    message: "Games List Show", 
        #    data: @games.to_json(:include => [:company, :platform])
        #}, 
        #    status: :ok
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
            #params.required(:game).permit(:name, :price, :author, :editor, :description, :company_id, :platform_id)
            params.permit(:name, :price, :description, :company_id, :platform_id)
        end

end
