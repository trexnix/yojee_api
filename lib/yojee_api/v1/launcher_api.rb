module YojeeApi
  module V1
    module LauncherApi
      module_function

      extend ApiHelper

      def create_company(name:, country: 'Singapore', currency: 'SGD')
        api_post '/launcher/company',
                 body:
                 {
                   name: name,
                   country: country,
                   currency: currency
                 }
      end

      def create_user(company_id:, name:, email:, password:)
        api_post '/launcher/user',
                 body: {
                   company_id: company_id,
                   name: name,
                   email: email,
                   password: password,
                   admin: true
                 }
      end
    end
  end
end
