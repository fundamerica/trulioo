# frozen_string_literal: true

module Trulioo
  module API
    # Trulioo::API::Base has information for the API classes to call the
    # endpoint correctly.
    class Base
      attr_reader :client

      def initialize(client)
        @client = client
      end

      private

      def get(*params)
        client.connector.get(namespace, *params)
      end

      def namespace
        @_namespace ||= self.class.name.split('::').last
      end

      def post(*params)
        client.connector.post(namespace, *params)
      end
    end
  end
end
