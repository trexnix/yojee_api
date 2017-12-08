# require 'ffaker'
require 'httparty'

require 'yojee_api/version'
require 'yojee_api/configuration'
require 'yojee_api/test_support/test_support'

require 'yojee_api/v1/base'
require 'yojee_api/v1/api_response'
require 'yojee_api/v1/launcher'
require 'yojee_api/v1/dispatcher'

module YojeeApi
  YOJEE_ADMIN_DEV_URL = 'http://driver-admin-dev.herokuapp.com'.freeze

  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new.tap do |config|
        config.base_url = YOJEE_ADMIN_DEV_URL
      end
    end
  end
end
