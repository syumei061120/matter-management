Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "matters#index"
  resources :matters do
    collection do
      get 'search'
      get 'clients', to: 'matters#new_client'
      post 'clients', to: 'matters#create_client'
    end
  end
  get 'sales_staff', to: 'matters#new_sales_staff'
  post 'sales_staff', to: 'matters#create_sales_staff'
  resources :users, only: [:show, :edit, :update]

end
