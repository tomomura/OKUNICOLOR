class Users::SessionsController < ApplicationController

  #
  #==== 認証成功時に呼び出される
  #
  def callback
    auth = request.env['omniauth.auth']
    user = UserProvider.find_by(name: auth['provider'], uid: auth['uid']).try(:user) || User.create_with_twitter_omniauth(auth)
    session[:user_id] = user.id

    redirect_to timelines_maps_path
  end

  #
  #=== 認証失敗時に呼び出される
  #
  def failure
    redirect_to root_path, alert: params[:message]
  end

end
