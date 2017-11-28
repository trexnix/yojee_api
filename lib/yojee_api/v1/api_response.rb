module YojeeApi
  module V1
    class ApiResponse
      attr_reader :success, :message

      def initialize(success, message)
        @success = success
        @message = message
      end

      def success?
        success
      end
    end
  end
end
