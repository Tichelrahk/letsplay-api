Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , defaults: {format: :json} do
    namespace :v1 do
      post '/login', to: 'users#login'
      resources :events, only: [:index, :show, :create, :update, :destroy] do
        resources :confirmations, only: [:create, :update]
        delete '/confirmations', to: 'confirmations#destroy'
        put '/tag_list', to: 'events#update_tags'
      end
      resources :users, only: [:show, :update]
      resources :locations, only: [:create]
      resources :favorites, only: [:create, :destroy]
    end
  end
end

