Rails.application.routes.draw do
  root "blogs#index"
  devise_for :users
  resources :blogs do
    collection { post :confirm }
  end
  resources :cats do
    collection { post :confirm }
  end
end
