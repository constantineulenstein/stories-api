Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stories, only: [ :index, :create, :show, :update, :destroy ] do
        resources :comments, only: [:create]
      end
    end
  end
end
