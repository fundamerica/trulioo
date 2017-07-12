# frozen_string_literal: true

require 'trulioo_test'

class TestConnection < TruliooTest
  def setup
    super unless name.include?('say_hello')
  end

  def test_say_hello
    call_endpoint
    assert_equal 200, last_status
    assert_equal 'Hello World', last_response
  end

  def test_say_hello_with_name
    r = client.connection.say_hello 'Company'
    assert_equal 200, r.code
    assert_equal 'Hello Company', r.parsed_response
  end

  def test_test_authentication
    call_endpoint
    assert_equal 200, last_status
    assert_equal "Hello #{trulioo_username}", last_response
  end
end
