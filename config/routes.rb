Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  namespace :admin, path: "d3m41emf5" do
    resources :restaurants

    root "restaurants#index"
  end
end
