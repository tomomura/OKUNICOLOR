class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #
  #=== ログインしているかどうかの検証
  #
  def login_required
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  helper_method :current_user

  private

  #
  #=== ログイン中のユーザの取得
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
