require "yaml"

auth_keys = YAML.load_file("#{Rails.root}/config/private_config/oauth_keys.yml")

Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :facebook, auth_keys["facebook_key"], auth_keys["facebook_secret"]
  #provider :twitter, auth_keys["twitter_consumer_key"], auth_keys["twitter_consumer_secret"]
end

