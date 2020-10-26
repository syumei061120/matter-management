Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "matters#index"
  resources :matters do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
