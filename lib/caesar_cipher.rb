# frozen_string_literal: true

# A cipher which shifts all letters in a string by a specified amount.
class CaesarCipher
  attr_reader :encrypted_string

  def initialize(string, shift_amount)
    @string = string
    @shift_amount = shift_amount
    @cipher = cipher
    @encrypted_string = encrypt_string
  end

  def cipher
    lowercase_letters = [*('a'..'z')]
    uppercase_letters = [*('A'..'Z')]
    create_cipher(lowercase_letters).merge(create_cipher(uppercase_letters))
  end

  def create_cipher(letters)
    Hash[letters.zip(letters.rotate(@shift_amount))]
  end

  def encrypt_string
    @string.chars.map { |char| @cipher.fetch(char, char) }.join
  end
end

