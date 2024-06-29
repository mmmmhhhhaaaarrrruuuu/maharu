Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  # Defines the root path route ("/")
  # root "posts#index"
  
  
  resources :users, only: [:show] # ユーザーマイページへのルーティング

    resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
   
  
  
  end
  resources :perfumes
  root 'tweets#top'

  get 'posts/trouble' => 'posts#trouble'
  get 'posts/advice' => 'posts#advice'
  get 'tweets/top' => 'tweets#top'
end
