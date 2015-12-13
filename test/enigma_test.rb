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
    e.encrypt("This is a message test")

    assert_equal Encrypt, e.encrypted_message.class
  end
end
