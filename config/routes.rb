Rails.application.routes.draw do

  get '/auth/:provider/callback',  to: 'users/sessions#callback'
  post '/auth/:provider/callback', to: 'users/sessions#callback'

end
