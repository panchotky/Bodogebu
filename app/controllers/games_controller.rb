class GamesController < ApplicationController

   before_action :require_admin, only: [:index, :edit, :update, :destroy]

  def top
  end

# ゲーム新規登録画面はレビュー検索結果に統合
  # def new
  #     @game = Game.new
  # end

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

  def reviews
  end

  def edit
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
