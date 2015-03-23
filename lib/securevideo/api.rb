require 'faraday'
require 'faraday_middleware'
require 'her'
require "securevideo/api/version"
require "securevideo/api/time_zones"
module Securevideo
  module Api
    class ClientNotConfigured < Exception; end
    class << self
      def configure(api_key, secret_key, &block)
        @api = Her::API.new
        @api.setup :url => "https://api.securevideo.com" do |c|
          c.basic_auth(api_key, secret_key)
          c.use FaradayMiddleware::EncodeJson
          c.use Her::Middleware::AcceptJSON
          c.use Her::Middleware::FirstLevelParseJSON
          yield c if block_given?
          c.adapter :excon
        end
        require "securevideo/api/user"
        require "securevideo/api/session"
        require "securevideo/api/participant"
      end

      def api
        # raise exception if somehow model classes gets required
        # before the API is configured
        fail ClientNotConfigured.new('Securevideo') unless @api
        @api
      end
    end

  end
end
