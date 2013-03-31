require Rails.root.join('lib/switch_connector')
SwitchConnector.configure do |config|
	config.host = '127.0.0.1'
	config.port = 3000
end