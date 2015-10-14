Rails.application.routes.draw do
  resources :users do
    resources :images
    resources :captions
  end

  resources :images do
    resources :captions
  end

  resources :captions do
    resources :captions
  end
end
