Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , defaults: {format: :json} do
    namespace :v1 do
      post '/login', to: 'users#login'
      resources :events, only: [:index, :show, :create, :update] do
        resources :confirmations, only: [:create, :update]
      end
      resources :users, only: [:show, :update]
      resources :locations, only: [:create]
      resources :favorites, only: [:create, :destroy]
    end
  end
end

