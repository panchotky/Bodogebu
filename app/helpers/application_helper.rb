module ApplicationHelper

   # View側からゲームのidを渡す
   def recommend_avarage(game)
       reviews = game.reviews
       recommend = 0
       reviews.each do |review|
         recommend = recommend + review.recommend
       end
       (recommend.to_f/reviews.count).round(2)

       return recommend
   end


end
