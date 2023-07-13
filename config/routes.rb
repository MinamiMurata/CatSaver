Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :blogs do
    collection { post :confirm }
  end
end
