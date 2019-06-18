class ApplicationController < ActionController::Base

   before_action :set_search

   def search
	    @search = Game.search(search_params)
	    @search_games = @q.result(distinct: true)
   end

   def time_search
       @time_search = Game.search(search_params)
	   @time_search_games = @q.result(distinct: true)
   end



   protected

	  def  set_search
	       @search = Game.ransack(params[:q])
	       @search_games = @search.result(distinct: true).order(id: :desc)
           @time_search = Game.ransack(params[:q])
	       @time_search_games = @time_search.result(distinct: true).order(id: :desc)
      end
end