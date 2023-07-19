Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, only: :show
  devise_scope :user do
    get "users/:id/edit_password", to: "users/registrations#edit_password", as: "edit_password"
    put "users/:id/update_password", to: "users/registrations#update_password", as: "update_password"
  end
  resources :blogs do
    collection { post :confirm }
  end
  resources :cats do
    collection { post :confirm }
  end
end
