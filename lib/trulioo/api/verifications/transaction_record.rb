# frozen_string_literal: true

module Trulioo
  module API
    class Verifications
      # Trulioo::API:Verifications:TransactionRecord holds the information of
      # the transaction record.
      class TransactionRecord
        attr_reader :datasources, :errors, :id, :rule, :status

        def initialize(record)
          @id = record['TransactionRecordID']
          @datasources = parse_datasources(record['DatasourceResults'])
          @status = record['RecordStatus']
          @errors = record['Errors']
          @rule = { record['Rule']['RuleName'] => record['Rule']['Note'] }
        end

        private

        def parse_datasources(results)
          results.each_with_object([]) { |ds, ary| ary << Datasource.new(ds) }
        end
      end
    end
  end
end
