Rails.application.routes.draw do

  get '/auth/:provider/callback',  to: 'users/sessions#callback'
  post '/auth/:provider/callback', to: 'users/sessions#callback'

  resources :users, only: :none do
    collection do
      get :sign_in
    end
  end

  root "users#sign_in"

end
