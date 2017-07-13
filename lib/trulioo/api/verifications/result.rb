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
          parse_response if code == 200
        end

        private

        def parse_response
          r = response.parsed_response
          @transaction_id = r['TransactionID']
          @uploaded_at = Time.parse(r['UploadedDt'])
          @input_fields = parse_fields(r['InputFields']) if r['InputFields']
          @errors = r['Errors']
          @transaction_record = TransactionRecord.new(r['Record'])
        end

        def parse_fields(fields)
          fields.each_with_object({}) do |field, h|
            h[Verifications.snake_case field['FieldName']] = field['Value']
          end
        end
      end
    end
  end
end
