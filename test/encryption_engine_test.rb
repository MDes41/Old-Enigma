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
    test_arr = " , end..." #splits the string and converts to array

    assert_equal [36, 38, 36, 4, 13, 3, 37, 37, 37], e.arr_of_string_to_aski(test_arr)
  end

  def test_add_date_to_key_arr
    e = EncryptionEngine.new
    e.abcd_rotations_split(12345)
    e.date_rotations_split(121215)

    assert_equal [18, 25, 36, 50], e.add_date_to_key_arr
  end

  def test_extend_key_with_date_arr
    e = EncryptionEngine.new
    string_arr = e.arr_of_string_to_aski("Hello, this is a test to test if my key is extended to the length of the message.")
    e.abcd_rotations_split(12345)
    e.date_rotations_split(121215)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr
    total = e.key_with_date_arr_extended.count

    assert_equal total, string_arr.count
  end

  def test_add_arr_of_aski_values_to_key_with_date_extended
    e = EncryptionEngine.new
    string_arr = e.arr_of_string_to_aski(" , end...")
    e.abcd_rotations_split(12345)
    e.date_rotations_split(121215)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr
    e.add_arr_of_aski_values_to_key_with_date_extended

    assert_equal [54, 63, 72, 54, 31, 28, 73, 87, 55], e.add_arr_of_aski_values_to_key_with_date_extended
  end

  def test_encrypt_message_array
    e = EncryptionEngine.new
    string_arr = e.arr_of_string_to_aski(" , end...")
    e.abcd_rotations_split(12345)
    e.date_rotations_split(121215)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr
    e.add_arr_of_aski_values_to_key_with_date_extended


    assert_equal ["p", "y", "7", "p", "5", "2", "8", "j", "q"], e.encrypt_integers_after_adjust_back_to_letters
  end



end
