require 'pry'
require_relative 'cypher'
class EncryptionEngine
  attr_reader :key_arr_integers,
              :date_arr_integers,
              :underscore_it,
              :arr_of_string,
              :arr_of_string_to_aski,
              :key_with_date_arr_extended,
              :break_encrypted_message_into_array,
              :arr_of_aski_values_encrypt,
              :arr_of_aski_values_decrypt

  def initialize
    @wheels = 4
  end

  def abcd_rotations_split(key)
    temporary_key_arr = key.to_s.chars
    a = temporary_key_arr[0..1].join("").to_i
    b = temporary_key_arr[1..2].join("").to_i
    c = temporary_key_arr[2..3].join("").to_i
    d = temporary_key_arr[3..4].join("").to_i
    @key_arr_integers = [a, b, c, d]
  end

  def date_rotations_split(date)
    temporary_date_arr = date ** 2
    temporary_string_of_dates = temporary_date_arr.to_s.chars[-4..-1]
    @date_arr_integers = temporary_string_of_dates.map{ |i| i.to_i }
  end

  def underscore_it(string)
    string.downcase.tr(" ", "_")
  end

  def arr_of_string(string)
    underscore_it(string).chars
  end

  def arr_of_string_to_aski(string)
    c = Cypher.new
    @arr_of_aski_values_encrypt = arr_of_string(string).map do |string|
      c.full_cypher_arr.index(string)
    end
  end

  def add_date_to_key_arr
    index = -1
    @key_with_date_arr = @key_arr_integers.map do |number|
      index += 1
      @date_arr_integers[index] + number
    end
  end

  def extend_key_with_date_arr(encrypt_or_decrypt_arr)

    length_of_message = encrypt_or_decrypt_arr.count
    arr_multiplyer = length_of_message / @wheels
    extra_letters = length_of_message % @wheels

    @key_with_date_arr_extended = @key_with_date_arr * arr_multiplyer
    if extra_letters != 0
      @key_with_date_arr_extended += @key_with_date_arr[0,extra_letters]
    end
  end

  def add_arr_of_aski_values_to_key_with_date_extended
    index = -1
    @key_date_aski_arr = @key_with_date_arr_extended.map do |number|
      index += 1
      @arr_of_aski_values_encrypt[index] + number
    end
  end

  def encrypt_integers_after_adjust_back_to_letters
    c = Cypher.new
    @encrypted_message_arr = @key_date_aski_arr.map do |number|
       c.full_cypher_arr[number % 39]
     end
  end

#dycrypt

  def break_encrypted_message_into_array(string)
    new_string = string.to_s
    @arr_of_encrypted_message = new_string.chars
  end

  def convert_arr_of_encrypted_message_to_reverse_cyper_aski
    c = Cypher.new
    @arr_of_aski_values_decrypt = @arr_of_encrypted_message.map do |each|
      c.full_cypher_arr_bkwrd.index(each)
    end
  end

  def add_arr_of_aski_values_decrypt_to_key_with_date_extended
    index = -1
    @key_date_aski_arr_decrypt = @key_with_date_arr_extended.map do |number|
      index += 1
      @arr_of_aski_values_decrypt[index] + number
    end
  end

  def decrypt_integers_after_adjust_back_to_letters
    c = Cypher.new
    @decrypted_message_arr = @key_date_aski_arr_decrypt.map do |number|
       c.full_cypher_arr_bkwrd[number % 39]
     end
  end

  def combine_decrypted_message_and_delete_the_underscores
    @decrypted_message_arr.join.tr("_"," ")
  end




end
