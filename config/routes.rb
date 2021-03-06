Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :patients, only: [ :index, :show, :update, :create, :destroy ] do
        resources :rdvs, only: [ :index, :create ]
      end
      resources :rdvs, only: [ :update, :show, :destroy ]
      get 'rdvs/', to: 'rdvs#index_all'
    end
  end
end
