require 'sblogistica'

Sblogistica.setup do |config|
  if File.exist?('config/sblogistica.yml')
    processed = YAML.load_file('config/sblogistica.yml')[Rails.env]

    processed.each do |k, v|
      config::register k.underscore.to_sym, v
    end

    config::Request.api_key = Sblogistica::api_key || ENV['SBLOGISTICA_API_KEY']
    config::Request.timeout = 15
    config::Request.open_timeout = 15
    config::Request.symbolize_keys = true
    config::Request.debug = false
  end
end