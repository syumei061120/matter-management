Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "matters#index"
  resources :matters do
      resources :clients, except: [:show]
      resources :business_talk_records, except: [:show]
    collection do
      get 'search'
      get 'clients', to: 'matters#new_client'
      post 'clients', to: 'matters#create_client'
    end
  end
  get 'sales_staffs', to: 'matters#new_sales_staff'
  post 'sales_staffs', to: 'matters#create_sales_staff'
  resources :users, only: [:show, :edit, :update]
  resources :sales_staffs, only: [:edit, :update]
end
