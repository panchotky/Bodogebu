class GamesController < ApplicationController
  def top
  end

# ゲーム新規登録画面はレビュー検索結果に統合
  # def new
  #     @game = Game.new
  # end

  def create
      @game = Game.new(game_params)
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
          params.require(:game).permit(:name, :min_player, :max_player, :image, :team)
    end

end
