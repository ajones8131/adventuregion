# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


Rails.application.configure do 
	# Forces all access to the app over SSL (Strict-Transport-Security)
	# and use secure cookies.
	config.force_ssl = true	
end