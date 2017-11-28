module YojeeApi
  module V1
    module Dispatcher
      module ApiApi
        module_function

        extend ApiHelper

        def login_api_user(email:, password:)
          result = post "/dispatcher/login",
                   body: {
                     email: email,
                     password: password
                   }
          build_response result, 'auth_token'
        end
      end
    end
  end
end
