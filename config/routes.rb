Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api , default: {format: :json} do
    namespace :v1 do
      resources :events, only: [:index, :show, :create, :update] do
        resources :confirmations, only: [:create, :update]
      end
      resources :users, only: [:show, :update]
      resources :locations, only: [:create]
    end
  end
end

