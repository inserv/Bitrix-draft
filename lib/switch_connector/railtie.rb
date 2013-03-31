require 'rails'

classCallServer::Railtie < Rails::Railtie
	config.call_server = ActiveSupport::OrderedOptions.new
	
	initializer "call_server.configure" do |app|
		CallServer.configure do |config|
			config.host = app.config.call_server[:host] || '127.0.0.1'
		end
	end
end