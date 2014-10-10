class Users::SessionsController < ApplicationController

  #
  #==== 認証成功時に呼び出される
  #
  def callback
    auth = request.env['omniauth.auth']
    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_twitter_omniauth(auth)
    session[:user_id] = user.id

    redirect_to root_path
  end

  #
  #=== 認証失敗時に呼び出される
  #
  def failure
    redirect_to root_path, alert: params[:message]
  end

end
