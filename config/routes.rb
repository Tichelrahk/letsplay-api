Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , defaults: {format: :json} do
    namespace :v1 do
      post '/login', to: 'users#login'
      resources :events, only: [:index, :show, :create, :update] do
        resources :confirmations, only: [:create, :update]
      end
      resources :users, only: [:show, :update]
      resources :locations, only: [:create]
    end
  end
end

