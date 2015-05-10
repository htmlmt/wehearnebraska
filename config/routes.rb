WeHearNebraska::Application.routes.draw do
  resources :posts


  resources :tweets


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  
  get 'sent', to: 'home#sent', as: 'sent'
  
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :tweets, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  
  get 'tweets/retweet-this', to: 'tweets#retweet_this', as: 'retweet'
  get 'tweets/unretweet-this', to: 'tweets#unretweet_this', as: 'unretweet'
  
  get 'tweets/ban', to: 'tweets#ban', as: 'ban'
  
  get 'tweets/favorite-this', to: 'tweets#favorite_this', as: 'favorite'
  get 'tweets/unfavorite-this', to: 'tweets#unfavorite_this', as: 'unfavorite'
  
  get 'tweets/profpic', to: 'tweets#profpic', as: 'profpic'
  
  root to: 'home#show'
end
