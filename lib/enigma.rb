require_relative 'encrypt'
require_relative 'decrypt'

class Enigma

  def encrypt(my_message, key)
    e = Encrypt.new(my_message, key)
  end

  def decrypt(my_message, key)
    e = Decrypt.new(my_message, key)
  end

end
