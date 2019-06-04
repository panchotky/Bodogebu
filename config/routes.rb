Rails.application.routes.draw do

  # deviseが自動作成してくれるルーティング
  devise_for :users

  # ルートパスをTOP画面に指定
  root to: 'games#top'

  # inquiriesコントローラ
  resources :inquiries, only: [:new, :create, :show, :index]
  get 'inquiries/confirm'

  # reviewsコントローラ
  resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'reviews/unification_view'
  get 'reviews/unification'

  # gamesコントローラ
  resources :games
  get 'games/top'
  get 'games/search'
  get 'games/search_name'
  get 'games/reviews'

  # usersコントローラ
  resources :users, only: [:index, :show, :edit, :update, :destroy]

end
