class User < ActiveRecord::Base
  has_secure_password
  validates :password ,presence:  true,length: {minimum: 6}

  def avatar_url
    hash_value =Digest::MD5.hexdigest(email.downcase)
    "http://www.gravatar.com/avatar/#{hash_value}?s=160"
  end
end
