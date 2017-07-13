# frozen_string_literal: true

module Trulioo
  module API
    # Trulioo::Verifications manages the "Verifications" API endpoints. This
    # accesses the Normalized API.
    class Verifications < Trulioo::API::Base
      class << self
        def snake_case(name)
          name.gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
        end
      end

      def transaction_record(transaction_id, option = nil)
        action = "transactionrecord/#{transaction_id}"
        action += "/#{option}" if option && option.to_sym.in?(options)
        Result.new(get(action, auth: true))
      end

      def verify(data)
        Result.new(post('verify', auth: true, body: data))
      end

      private

      def options
        %i[verbose withaddress]
      end

      def verifications_namespace
        @namespace = 'verifications'
      end
    end
  end
end
