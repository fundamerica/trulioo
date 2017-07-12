# frozen_string_literal: true

require 'trulioo_test'

class TestConfiguration < TruliooTest
  def test_consents
    call_endpoint country
    assert_equal 200, last_status
  end

  def test_country_codes
    call_endpoint
    assert_equal 200, last_status
  end

  def test_country_subdivisions
    call_endpoint country
    assert_equal 200, last_status
  end

  def test_document_types
    call_endpoint country
    assert_equal 200, last_status
  end

  def test_fields
    call_endpoint country
    assert_equal 200, last_status
  end
end
