# frozen_string_literal: true

require 'trulioo_test'

class TestVerifications < TruliooTest
  def test_transaction_record
    call_endpoint transaction_id
    assert_equal 200, last_status
    assert_equal 'match', response.transaction_record.status
  end

  def test_verify
    call_endpoint verification_params['US']
    assert_equal 200, last_status
    assert_equal 'match', response.transaction_record.status
  end
end
