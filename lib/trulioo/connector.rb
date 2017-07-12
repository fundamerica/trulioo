# frozen_string_literal: true

require 'json'
require 'httparty'

module Trulioo
  # Trulioo::Connector manages the calls to the API.
  class Connector
    attr_reader :settings

    def initialize(settings)
      @settings = settings
    end

    %i[get post].each do |verb|
      define_method(verb) do |namespace, action, options = {}|
        HTTParty.send(verb, url(namespace, action), params(options))
      end
    end

    private

    def auth_params
      {
        basic_auth: {
          username: settings.username,
          password: settings.password
        }
      }
    end

    def params(options)
      params = {
        headers: {
          'Content-Type' => 'application/json'
        }
      }
      params.merge!(auth_params) if options[:auth]
      params[:body] = params_body(options[:body]) if options[:body]
      params
    end

    def params_body(body)
      { AcceptTruliooTermsAndConditions: true }.merge(body).to_json
    end

    def url(namespace, action)
      URI.encode(
        "#{settings.base_uri}/#{namespace}/#{settings.api_version}/#{action}"
      )
    end
  end
end
