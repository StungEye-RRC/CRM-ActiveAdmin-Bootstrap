Rails.application.routes.draw do
  root to: 'customers#index'

  resources :customers, only: [:index] do
    member do
      post :remember_to_call
      post :mark_as_called
    end
    collection do
      post :mark_all_as_called
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
