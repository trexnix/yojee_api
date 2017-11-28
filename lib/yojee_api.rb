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
  # Your code goes here...

  class << self
    def configure
      yield config
    end

    def config
      @config ||= Configuration.new
    end
  end
end
