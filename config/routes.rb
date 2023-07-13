Rails.application.routes.draw do
  root "blogs#index"
  resources :blogs do
    collection { post :confirm }
  end
end
