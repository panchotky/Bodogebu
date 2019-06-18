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
         @game = Game.find(params[:game_id])
      	 render :new
      end
  end


  def show
      @review = Review.find(params[:id])
  end

  def edit
  end

  def unification_view
  end

  private

      def review_params
          params.require(:review).permit(:game_id, :user_id, :recommend, :strategy, :luck, :memory, :talk,
                                         :quick, :psychology, :imagination, :play_time, :comment, :favorite, :player)
      end

end
