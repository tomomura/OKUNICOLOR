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

end
