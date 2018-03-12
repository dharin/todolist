Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create] do
    resources :lists, only: [:index, :show, :create] do 
      resources :items, only: [:create, :update]
    end
  end

  root "users#new" 
end
