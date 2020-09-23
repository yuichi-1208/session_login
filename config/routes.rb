Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :blogs do
    collection do#collection doはidなどを必要としない固有のルーティングを生成する
      post :confirm
    end
  end
end
