require_relative 'encrypt'

class Enigma
  attr_accessor :encrypted_message

  def encrypt(my_message)
    @encrypted_message = Encrypt.new(my_message)
  end

end
