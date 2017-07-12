# frozen_string_literal: true

module Trulioo
  module API
    # Trulioo::Configuration manages the "Configuration" API endpoints. This
    # will tell you how your account is configured.
    class Configuration < Trulioo::API::Base
      def consents(country)
        configuration_namespace
        get("consents/#{configuration_name}/#{country}", auth: true)
      end

      def country_codes
        configuration_namespace
        get("countrycodes/#{configuration_name}", auth: true)
      end

      def country_subdivisions(country)
        configuration_namespace
        get("countrysubdivisions/#{country}", auth: true)
      end

      def document_types(country)
        configuration_namespace
        get("documentTypes/#{country}", auth: true)
      end

      def fields(country)
        configuration_namespace
        get("fields/#{configuration_name}/#{country}", auth: true)
      end

      private

      def configuration_name
        'Identity Verification'
      end

      def configuration_namespace
        @namespace = 'configuration'
      end
    end
  end
end
