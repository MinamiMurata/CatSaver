Rails.application.routes.draw do
  root "home#index"
  get "searches/select_symptom", as: "select_symptom"
  get "searches/select_age", as: "select_age"
  get "searches/select_breed", as: "select_breed"
  get "searches/search_results", as: "search_results"

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
