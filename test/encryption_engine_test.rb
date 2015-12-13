require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encryption_engine'
require 'pry'

class EncryptionEngineTest < Minitest::Test

  def test_given_key_assigns_to_an_array
    e = EncryptionEngine.new
    e.abcd_rotations_split(12345)

    assert_equal [12, 23, 34, 45], e.key_arr_integers
  end

  def test_that_the_date_is_assigned_to_abcd
    e = EncryptionEngine.new
    e.date_rotations_split(121215)

    assert_equal [6, 2, 2, 5], e.date_arr_integers
  end

  def test_joins_a_string_with_underscore
    e = EncryptionEngine.new


    assert_equal "u_n_d_e_r_s_c_o_r_e_i_t", e.underscore_it("u n d e r s c o r e i t")
  end

  def test_takes_a_string_makes_it_arr
    e = EncryptionEngine.new
    arr_of_string = e.arr_of_string("., T his_test_a_message_is_arr")

    assert_equal [".", ",", "_", "t", "_", "h"], arr_of_string[0..5]
  end

  def test_return_aski_value_from_array_map
    e = EncryptionEngine.new
    ["t", "w", "_", "9"].arr_of_string_to_aski

  end


end
