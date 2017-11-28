# Provide support for integration testing for external box
require 'ffaker'

module YojeeApi
  module TestSupport
    extend self

    ApiError = Class.new(StandardError)

    def setup_company
      company_id = create_company

      password = FFaker::Internet.unique.password
      email = FFaker::Internet.unique.email
      create_dispatcher(company_id: company_id,
                        email: email,
                        password: password)

      admin_token = login_user(email: email, password: password)
      admin_token = 'stvNTA7ADSAH5bk39Tq4'
    end

    def setup_worker(company_id)
      phone = "+65" + FFaker::PhoneNumberSG.unique.mobile_number
      response = YojeeApi::V1::Dispatcher.new.register_worker(
        name: FFaker::Name.unique.name,
        email: FFaker::Internet.unique.email,
        phone: phone,
        company_id: company_id
      )
      raise ApiError, response.message unless response.success?
      response.message
    end

    def create_company
      response = YojeeApi::V1::Launcher.new.create_company(
        name: FFaker::Company.unique.name
      )

      raise ApiError, response.message unless response.success?
      response.message["id"]
    end

    def create_dispatcher(company_id:, email:, password:)
      response = YojeeApi::V1::Launcher.new.create_user(
        name: FFaker::Name.unique.name,
        email: email,
        password: password,
        company_id: company_id
      )

      raise ApiError, response.message unless response.success?
      response.message["id"]
    end

    def login_user(email:, password:)
      response = YojeeApi::V1::Dispatcher.new.login_api_user(email: email, password: password)
      raise ApiError, response.message unless response.success?
      response.message['auth_token']
    end
  end
end
