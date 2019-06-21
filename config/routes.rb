Rails.application.routes.draw do

  # deviseのコントローラーをUser下に設置したのでルーティングの変更
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end


  # ルートパスをTOP画面に指定
  root to: 'games#top'

  # inquiriesコントローラ
  resources :inquiries, only: [:new, :create, :show, :index, :update]
  get 'inquiries/confirm'
  post 'inquiries/confirm' => 'inquiries#confirm'

  # gamesコントローラ
  get 'games/top'
  get 'games/search'
  get 'games/search_name'
  get 'games/reviews'
  resources :games do
      # reviewsコントローラ レビューのURLに親ゲームのIDを持たせられるようにネストさせる
    resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
  end
    get 'reviews/unification_view'
    get 'reviews/unification'

  # usersコントローラ
  resources :users, only: [:index, :show, :edit, :update, :destroy]

end
