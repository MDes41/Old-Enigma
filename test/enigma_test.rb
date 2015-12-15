require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/enigma'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_enigma_is_a_class
    assert e = Enigma.new
  end

  def test_encrypt_method_calls_on_encrypt_class
    e = Enigma.new


    assert_equal Encrypt, e.encrypt("This is a message test", 12345).class
  end

  def test_decrypt_method_calls_on_decrypt_class
    e = Enigma.new

    assert_equal Decrypt, e.decrypt(".6f3p7piswjp_e_rwwqp_f", 12345).class
  end


end
