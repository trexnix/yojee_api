module YojeeApi
  module V1
    class Base
      include HTTParty
      # base_uri YojeeApi.config.base_url + '/api/v1'
      format :json

      def initialize(base_url = YojeeApi.config.base_url)
        self.class.base_uri(base_url + '/api/v1')
      end

      def success?(result)
        result.response.code.to_s.start_with?("2") &&
          (json_body(result)["result"] == "ok" ||
            json_body(result)["status"] == "ok")
      end

      def json_body(result)
        JSON.parse(result.response.body)
      end

      def json_message(result)
        JSON.parse(result.response.body)['message']
      end

      def build_response(result, field = 'message')
        ApiResponse.new(success?(result), JSON.parse(result.response.body)[field])
      end

      def api_post(*arg)
        result = self.class.post *arg
        build_response result
      end

      def api_get(*arg)
        result = self.class.get *arg
        build_response result
      end

      def api_put(*arg)
        result = self.class.put *arg
        build_response result
      end

      def api_delete(*arg)
        result = self.class.delete *arg
        build_response result
      end

      def api_patch(*arg)
        result = self.class.patch *arg
        build_response result
      end
    end
  end
end
