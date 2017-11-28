module YojeeApi
  module V1
    module ApiHelper

      def self.extended(base)
        base.send(:include, HTTParty)
        base.send(:base_uri, YojeeApi.config.base_url + '/api/v1')
        base.send(:format, :json)
      end

      def success?(result)
        result.response.code.to_s.starts_with?("2") &&
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
        result = post *arg
        build_response result
      end

      def api_get(*arg)
        result = get *arg
        build_response result
      end

      def api_put(*arg)
        result = put *arg
        build_response result
      end

      def api_delete(*arg)
        result = delete *arg
        build_response result
      end

      def api_patch(*arg)
        result = patch *arg
        build_response result
      end
    end
  end
end
