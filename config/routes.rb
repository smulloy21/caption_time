Rails.application.routes.draw do

  devise_for :users
  root :to => 'images#index'

  resources :images do
    resources :captions
  end

  resources :captions do
    resources :captions
  end
end
