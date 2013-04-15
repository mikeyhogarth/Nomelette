require 'yaml'

begin
	Nomelette::Application.config.secret_token = YAML.load_file("#{Rails.root}/config/private_config/secret_key.yml")
	puts "REAL secret key used"
rescue
	Nomelette::Application.config.secret_token = '*development-fallback-key*development-fallback-key*development-fallback-key*development-fallback-key*'
	puts "FALLBACK secret key used"
end
