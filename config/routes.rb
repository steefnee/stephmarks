Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks
  end

  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end

  resources :likes, only: [:index]


  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'topics#index'

  post :incoming, to: 'incoming#create'
end
