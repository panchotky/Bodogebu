class GamesController < ApplicationController

   before_action :require_admin, only: [:index, :edit, :update, :destroy]

  def top
      @games = Game.all.order(created_at: "DESC")
  end

  def create
      @game = Game.new(game_params)
      p params
      if @game.save
       redirect_to new_game_review_path(@game.id)
      else
        render :new
      end
  end

  def search
      @games = Game.all
  end

  def search_name
      @game = Game.new
  end

  def index
      @games = Game.all
  end

  def show
      @game = Game.find(params[:id])
      @reviews = @game.reviews.all
  end

  def edit
      @game = Game.find(params[:id])
  end

  def update
      @game = Game.find(params[:id])
      if @game.update(game_params)
         redirect_to game_path(@game.id)
      else
         render :edit
      end
  end

  def destroy
      @game = Game.find(params[:id])
      @game.destroy
      redirect_to games_path
  end

  private

    def game_params
          params.require(:game).permit(:name, :min_player, :max_player, :image, :team, :time)
    end

    def require_admin
              if user_signed_in?

                  if current_user.admin?
                  else
                     redirect_to root_path
                  end
              else
                redirect_to root_path
              end
    end

end
