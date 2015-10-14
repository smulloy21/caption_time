class User < ActiveRecord::Base
  has_many :images
  has_many :captions
  has_secure_password
end
