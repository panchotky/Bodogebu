class ApplicationController < ActionController::Base

   before_action :set_search

   def search
	    @search = Game.search(search_params)
	    @search_games = @q.result(distinct: true)
   end



   protected

	  def  set_search
	       @search = Game.ransack(params[:q])
	       @search_games = @search.result(distinct: true).order(id: :desc)
      end
end