class User < ActiveRecord::Base
  has_many :graphs
  has_many :datasets
  def self.find_or_create_with_omniauth(auth_hash)
     user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
     user.update(
      name: auth_hash.info.name,
      token:auth_hash.credentials.token,
      secret:auth_hash.credentials.secret
      )
    user
  end
end
