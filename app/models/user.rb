class User < ActiveRecord::Base

  has_many :user_providers

  validates :name,
    presence: true

  #
  #=== 取得したOAuth情報を元にユーザを作成する
  #
  def self.create_with_twitter_omniauth(auth)
    create! do |user|
      user.name = auth['info']['name']

      credentials = auth['credentials']
      user.user_providers.build(
        name:   auth['provider'],
        uid:    auth['uid'],
        token:  credentials.token,
        secret: credentials.secret,
      )
    end
  end

  #
  #=== Twitterのクライアントを作成する
  #
  def twitter_client
    if provider = self.user_providers.twitter.first
      Twitter::REST::Client.new do |config|
        config.consumer_key        = Settings.twitter.consumer_key
        config.consumer_secret     = Settings.twitter.consumer_secret
        config.access_token        = provider.token
        config.access_token_secret = provider.secret
      end
    end
  end

end
