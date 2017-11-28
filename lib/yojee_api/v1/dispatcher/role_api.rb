module YojeeApi
  module V1
    module Dispatcher
      module RoleApi
        module_function

        extend ApiHelper

        def add_role(token:, name:, access_map: [])
          api_post '/dispatcher/roles',
                   body: {
                     name: name,
                     access_map: {
                       actions: access_map
                     }
                   },
                   headers: {
                     :"Access-Token" => token
                   }
        end
      end
    end
  end
end
