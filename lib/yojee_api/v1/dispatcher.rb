module YojeeApi
  module V1
    class Dispatcher < Base

      def login_api_user(email:, password:)
        result = api_post "/dispatcher/login",
                 body: {
                   email: email,
                   password: password
                 }
        build_response result, 'auth_token'
      end

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
