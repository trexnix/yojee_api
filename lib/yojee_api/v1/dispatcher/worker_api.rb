module YojeeApi
  module V1
    module Dispatcher
      module WorkerApi
        module_function

        extend ApiHelper

        def register_worker(name:, phone:, email:, company_id:, formdata: '{}')
          api_post '/dispatcher/workers/register',
                   body: {
                     name: name,
                     phone: phone,
                     email: email,
                     company_id: company_id,
                     formdata: formdata
                   }
        end
      end
    end
  end
end
