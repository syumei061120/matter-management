Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "matters#index"
  resources :matters do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
