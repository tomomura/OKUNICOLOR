class User < ActiveRecord::Base

  #
  #=== 取得したOAuth情報を元にユーザを作成する
  #
  def self.create_with_twitter_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
    end
  end

end
