module Securevideo
  module Api
    class Response < SimpleDelegator
      attr_reader :response
      def initialize(response)
        super
        @response = response
      end

      def success?
        status == :ok
      end

      def status
        if !response.respond_to?(:Message) || response.Message.nil?
          :ok
        else
          :error
        end
      end

      def error_message
        response.Message
      end

      def error_details
        response.MessageDetail
      end

      def to_s
        "status:#{status} message:#{success? ? '' : error_message}"
      end

      def inspect
        "#{self.class.name} - #{self.to_s}"
      end
    end
  end
end
