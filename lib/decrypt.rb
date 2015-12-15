require_relative 'encryption_engine'
require 'pry'

class Decrypt
  def initialize(my_message, key)
    @my_message = my_message
    @date = todays_date
    @key = key.to_i
    e = EncryptionEngine.new
    e.break_encrypted_message_into_array(@my_message)
    e.convert_arr_of_encrypted_message_to_reverse_cyper_aski
    e.abcd_rotations_split(@key)
    e.date_rotations_split(@date)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr(e.arr_of_aski_values_decrypt)
    e.add_arr_of_aski_values_decrypt_to_key_with_date_extended
    e.decrypt_integers_after_adjust_back_to_letters
    puts e.combine_decrypted_message_and_delete_the_underscores

  end

  def todays_date
    date = Time.new
    date.strftime("%d%m%y").to_i
  end

end

# e = Decrypt.new("thisisatest", 12345)
