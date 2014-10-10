Rails.application.routes.draw do

  get '/auth/:provider/callback',  to: 'users/sessions#callback'
  post '/auth/:provider/callback', to: 'users/sessions#callback'

  get '/auth/failure',  to: 'users/sessions#failure'

  resources :users, only: :none do
    collection do
      get :sign_in
    end
  end

  root "users#sign_in"

end
