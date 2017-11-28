module YojeeApi
  module V1
    module Dispatcher
      module UserApi
        module_function

        extend ApiHelper

        def add_user(name:, email:, phone:, password:, role:, company_id:)
          api_post '/dispatcher/users',
                   body: {
                     user: {
                       name: name,
                       email: email,
                       phone: phone,
                       password: password
                     }
                   }
        end
      end
    end
  end
end
