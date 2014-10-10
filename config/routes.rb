Rails.application.routes.draw do

  namespace :timelines do
    resources :maps, only: :index 
  end

  get '/auth/:provider/callback',  to: 'users/sessions#callback'
  post '/auth/:provider/callback', to: 'users/sessions#callback'

  get '/auth/failure',  to: 'users/sessions#failure'

  resources :users, only: :none do
    collection do
      get :sign_in
    end
  end

  root "users#sign_in"

  resources :timelines, only:[:index]

end
