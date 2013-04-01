
class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :admin
  has_secure_password
  
  validates_uniqueness_of :username
  validates_presence_of :username
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :on => :create
end
