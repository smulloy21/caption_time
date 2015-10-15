Rails.application.routes.draw do

  devise_for :users
  root :to => 'images#index'

  resources :images, only: [:index, :show, :create, :update] do
    resources :captions, only: [:create]
  end

  resources :captions, only: [:create, :update, :destroy] do
    resources :captions, only: [:create]
  end
end
