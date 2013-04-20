
class User < ActiveRecord::Base
  
  has_secure_password

  attr_accessible :username, :password, :password_confirmation, :admin  
  
  validates_confirmation_of :password, :on => :create
  validates_uniqueness_of :username
  validates_presence_of :username  

  has_one :user_profile

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]      

      #Set password digest to bypass validation, give it a string of 
      #text that nothing would ever hash to
      user.password_digest = "#{auth["provider"]}-authorized account"

      user.user_profile = UserProfile.new
      user.user_profile.full_name = auth["info"]["name"]
      user.user_profile.avatar_url = auth["info"]["image"]      
    end
  end

  #scopes
  default_scope order('username ASC')

end
