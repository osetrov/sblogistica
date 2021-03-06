require 'faraday'
require 'multi_json'
require "sblogistica/version"
require 'sblogistica/error'
require 'sblogistica/request'
require 'sblogistica/api_request'
require 'sblogistica/response'

module Sblogistica
  class << self

    def generate_access_token(system: 'LDAP')
      client = Faraday.new(Sblogistica.api_token_url, proxy: Sblogistica::Request.proxy,
                           ssl: Sblogistica::Request.ssl_options) do |faraday|
        faraday.basic_auth(Sblogistica.api_client_id, Sblogistica.api_client_secret)
        faraday.response :raise_error
        faraday.adapter Faraday.default_adapter
        if Sblogistica::Request.debug
          faraday.response :logger, Sblogistica::Request.logger, bodies: true
        end
      end
      response = client.post do |request|
        request.params.merge!({system: system})
        request.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        request.headers['User-Agent'] = "Sblogistica/#{Sblogistica::VERSION} Ruby gem"
        request.body = "grant_type=password&username=#{Sblogistica.api_username}&password=#{Sblogistica.api_password}"
      end
      JSON.parse(response.body).try(:dig, "access_token")
    end

    def setup
      yield self
    end

    def register(name, value, type = nil)
      cattr_accessor "#{name}_setting".to_sym

      add_reader(name)
      add_writer(name, type)
      send "#{name}=", value
    end

    def add_reader(name)
      define_singleton_method(name) do |*args|
        send("#{name}_setting").value(*args)
      end
    end

    def add_writer(name, type)
      define_singleton_method("#{name}=") do |value|
        send("#{name}_setting=", DynamicSetting.build(value, type))
      end
    end
  end

  class DynamicSetting
    def self.build(setting, type)
      (type ? klass(type) : self).new(setting)
    end

    def self.klass(type)
      klass = "#{type.to_s.camelcase}Setting"
      raise ArgumentError, "Unknown type: #{type}" unless Sblogistica.const_defined?(klass)
      Sblogistica.const_get(klass)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end
end
