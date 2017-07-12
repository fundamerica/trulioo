# frozen_string_literal: true

require 'trulioo/api'
require 'trulioo/connector'

module Trulioo
  # Trulioo::Client handles the Connector and the different API endpoints for
  # easy access.
  class Client
    attr_reader :connector, :configuration, :connection, :verifications

    def initialize(settings = Trulioo.settings)
      @connector = Trulioo::Connector.new(settings)
      @configuration = Trulioo::API::Configuration.new(self)
      @connection = Trulioo::API::Connection.new(self)
      @verifications = Trulioo::API::Verifications.new(self)
    end
  end
end
