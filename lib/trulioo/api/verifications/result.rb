# frozen_string_literal: true

module Trulioo
  module API
    class Verifications
      # Trulioo::API:Verifications:Result is a wrapper for the verifications
      # endpoints' response.
      class Result
        attr_reader :code,
                    :errors,
                    :input_fields,
                    :response,
                    :transaction_id,
                    :transaction_record,
                    :uploaded_at

        def initialize(response)
          @code = response.code
          @response = response
          parse_response(response.parsed_response) if code == 200
        end

        private

        def parse_response(r)
          @transaction_id = r['TransactionID']
          @uploaded_at = Time.parse(r['UploadedDt'])
          @input_fields = Verifications.parse_fields(r['InputFields'], 'Value')
          @errors = r['Errors']
          @transaction_record = TransactionRecord.new(r['Record'])
        end
      end
    end
  end
end
