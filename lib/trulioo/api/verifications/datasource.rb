# frozen_string_literal: true

module Trulioo
  module API
    class Verifications
      # Trulioo::API:Verifications:Datasource is the result of an individual
      # datasource.
      class Datasource
        attr_reader :appended_fields, :errors, :field_groups, :fields, :name
        def initialize(datasource)
          @name = datasource['DatasourceName']
          @fields = parse_fields(datasource['DatasourceFields'])
          @appended_fields = datasource['AppendedFields']
          @errors = datasource['Errors']
          @field_groups = datasource['FieldGroups']
        end

        private

        def parse_fields(fields)
          fields.each_with_object({}) do |field, h|
            h[Verifications.snake_case field['FieldName']] = field['Status']
          end
        end
      end
    end
  end
end
