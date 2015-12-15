require_relative 'encryption_engine'
require 'pry'

class Encrypt


  def initialize(my_message, key)
    @my_message = my_message
    @date = todays_date
    @key = key.to_i
    e = EncryptionEngine.new
    string_arr = e.arr_of_string_to_aski(@my_message)
    e.abcd_rotations_split(@key)
    e.date_rotations_split(@date)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr(e.arr_of_aski_values_encrypt)
    e.add_arr_of_aski_values_to_key_with_date_extended
    puts e.encrypt_integers_after_adjust_back_to_letters.join
  end

  def todays_date
    date = Time.new
    date.strftime("%d%m%y").to_i
  end
end

# e = Encrypt.new("this is a test", 12345)
