class ReviewsController < ApplicationController

  def new
      @game = Game.find(params[:game_id])
  	  @review = Review.new
  end

  def create
  	  @review = Review.new(review_params)
  	  @game = Game.find(params[:game_id])
  	  @review.user_id = current_user.id
      @review.game_id = @game.id
      if @review.save
         @game.time = view_context.play_time_avarage(@game)
         @game.save
         redirect_to user_path(current_user.id)
      else
      	 render :new
      end
  end


  def show
      @review = Review.find(params[:id])
  end

  def edit
      @review = Review.find(params[:id])
      @game = Game.find(params[:game_id])
  end

  def update
      @review = Review.find(params[:id])
      @game = Game.find(params[:game_id])
      if @review.update(review_params)
         @game.time = view_context.play_time_avarage(@game)
         @game.save
         redirect_to user_path(current_user.id)
      else
         render :edit
      end
  end

  private

      def review_params
          params.require(:review).permit(:game_id, :user_id, :recommend, :strategy, :luck, :memory, :talk,
                                         :quick, :psychology, :imagination, :play_time, :comment, :favorite, :player)
      end

end
