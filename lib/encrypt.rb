require_relative 'encryption_engine'

class Encrypt
  attr_reader :my_message

  def initialize(my_message)
    @my_message = my_message
    @date = 121215
    @key = 56134
    e = EncryptionEngine.new
    string_arr = e.arr_of_string_to_aski(my_message)
    e.abcd_rotations_split(@key)
    e.date_rotations_split(@date)
    e.add_date_to_key_arr
    e.extend_key_with_date_arr
    e.add_arr_of_aski_values_to_key_with_date_extended
    puts e.encrypt_integers_after_adjust_back_to_letters.join

  end
end

c = Encrypt.new("this is the...end...")
