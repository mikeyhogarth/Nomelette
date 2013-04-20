class UserProfile < ActiveRecord::Base
  attr_accessible :full_name, :avatar_url

  belongs_to :user
end
