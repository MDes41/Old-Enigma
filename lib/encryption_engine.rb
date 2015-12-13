require 'pry'
class EncryptionEngine
  attr_reader :key_arr_integers,
              :date_arr_integers,
              :underscore_it,
              :arr_of_string,
              :arr_of_string_to_aski

  def abcd_rotations_split(key)
    temporary_key_arr = key.to_s.chars
    a = temporary_key_arr[0..1].join("").to_i
    b = temporary_key_arr[1..2].join("").to_i
    c = temporary_key_arr[2..3].join("").to_i
    d = temporary_key_arr[3..4].join("").to_i
    @key_arr_integers = [a, b, c, d]
  end

  def get_four_digit_date

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

  def arr_of_string_to_aski
    each do |string|

  end

end
