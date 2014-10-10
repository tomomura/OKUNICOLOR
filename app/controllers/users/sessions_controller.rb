class Users::SessionsController < ApplicationController

  def callback
    puts 'callback!'
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_twitter_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end

end
