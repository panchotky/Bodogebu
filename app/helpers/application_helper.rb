module ApplicationHelper

   # View側からゲームのidを渡す
   def recommend_avarage(game)
       reviews = game.reviews
       recommend = 0
       reviews.each do |review|
         recommend = recommend + review.recommend
       end
       return (recommend.to_f/reviews.count).round(1)
   end

   def play_time_avarage(game)
       reviews = game.reviews
       play_time = 0
       reviews.each do |review|
         play_time = play_time + review.play_time
       end
       return (play_time.to_f/reviews.count).round(2)

       
   end

   def strategy_avarage(game)
       reviews = game.reviews
       strategy = 0
       reviews.each do |review|
         strategy = strategy + review.strategy
       end
       return (strategy.to_f/reviews.count).round(2)

       
   end

   def luck_avarage(game)
       reviews = game.reviews
       luck = 0
       reviews.each do |review|
         luck = luck + review.luck
       end
       return (luck.to_f/reviews.count).round(2)

       
   end

   def memory_avarage(game)
       reviews = game.reviews
       memory = 0
       reviews.each do |review|
         memory = memory + review.memory
       end
       return (memory.to_f/reviews.count).round(2)

       
   end

   def quick_avarage(game)
       reviews = game.reviews
       quick = 0
       reviews.each do |review|
         quick = quick + review.quick
       end
       return (quick.to_f/reviews.count).round(2)

       
   end

   def talk_avarage(game)
       reviews = game.reviews
       talk = 0
       reviews.each do |review|
         talk = talk + review.talk
       end
       return (talk.to_f/reviews.count).round(2)

       
   end

   def psychology_avarage(game)
       reviews = game.reviews
       psychology = 0
       reviews.each do |review|
         psychology = psychology + review.psychology
       end
       return (psychology.to_f/reviews.count).round(2)

       
   end

end
