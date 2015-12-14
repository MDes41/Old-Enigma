require 'pry'

class Cypher
  attr_reader :letters_arr,
              :zero_to_9_arr,
              :extra_char_arr,
              :full_cypher_arr

  def initialize
    @full_cypher_arr = letters_arr + zero_to_9_arr + extra_char_arr
  end

  def letters_arr
    ("a".."z").to_a
  end

  def zero_to_9_arr
    temp_0_9_arr_int = (0..9).to_a
    temp_0_9_arr_int.map { |i| i.to_s  }
  end

  def extra_char_arr
    ["_", ".", ","]
  end

end
