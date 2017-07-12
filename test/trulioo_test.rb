# frozen_string_literal: true

require 'minitest/autorun'
require 'trulioo'
require 'yaml'

class TruliooTest < Minitest::Test
  attr_reader :country,
              :last_response,
              :last_status,
              :response,
              :transaction_id,
              :trulioo_username,
              :trulioo_password,
              :verification_params

  def setup
    load_variables
    configure_trulioo
  end

  private

  def action
    name.gsub(/^test_/, '')
  end

  def call_endpoint(*params)
    @response = client.send(namespace).send(action, *params)
    @last_response = response.parsed_response if
      response.methods.include? :parsed_response
    @last_status = response.code
  end

  def client
    @_client ||= Trulioo::Client.new
  end

  def configure_trulioo
    Trulioo.configure do |config|
      config.username = trulioo_username
      config.password = trulioo_password
    end
  end

  def load_variables
    vars = YAML.load_file 'test/vars.yml'
    vars.each { |k, v| instance_variable_set :"@#{k}", v }
  end

  def namespace
    self.class.name.gsub('Test', '').downcase
  end
end
