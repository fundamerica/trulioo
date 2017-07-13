# frozen_string_literal: true

module Trulioo
  module API
    class Verifications
      # Trulioo::API:Verifications:Datasource is the result of an individual
      # datasource.
      class Datasource
        attr_reader :appended_fields,
                    :datasource_fields,
                    :errors,
                    :field_groups,
                    :name

        def initialize(datasource)
          @name = datasource['DatasourceName']
          @datasource_fields = Verifications.parse_fields(
            datasource['DatasourceFields'],
            'Status'
          )
          @appended_fields = Verifications.parse_fields(
            datasource['AppendedFields'],
            'Data'
          )
          @errors = datasource['Errors']
          @field_groups = datasource['FieldGroups']
        end
      end
    end
  end
end
