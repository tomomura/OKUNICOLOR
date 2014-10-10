class UserProvider < ActiveRecord::Base

  validates :name,
    presence: true
  validates :uid,
    presence: true
  validates :token,
    presence: true
  validates :secret,
    presence: true

  belongs_to :user

end
