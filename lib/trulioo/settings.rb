# frozen_string_literal: true

module Trulioo
  # Trulioo::Settings holds the variables used to connect to Trulioo's servers.
  class Settings
    attr_accessor :api_version, :base_uri, :password, :url, :username

    def initialize
      @api_version = 'v1'
      @base_uri = 'https://api.globaldatacompany.com'
    end
  end
end
