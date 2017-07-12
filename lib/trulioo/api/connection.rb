# frozen_string_literal: true

module Trulioo
  module API
    # Trulioo::Connection manages the "Connection" API endpoints. These are used
    # to test your connection to the Trulioo servers.
    class Connection < Trulioo::API::Base
      def say_hello(name = 'World')
        connection_namespace
        get("sayhello/#{name}")
      end

      def test_authentication
        connection_namespace
        get('testauthentication', auth: true)
      end

      private

      def connection_namespace
        @namespace = 'connection'
      end
    end
  end
end
