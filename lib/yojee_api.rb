require 'yojee_api/version'
require 'yojee_api/configuration'
require 'yojee_api/test_support/test_support'

require 'yojee_api/v1/api_helper'
require 'yojee_api/v1/api_response'
require 'yojee_api/v1/launcher_api'
require 'yojee_api/v1/dispatcher/api_api'
require 'yojee_api/v1/dispatcher/role_api'
require 'yojee_api/v1/dispatcher/user_api'
require 'yojee_api/v1/dispatcher/worker_api'

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
