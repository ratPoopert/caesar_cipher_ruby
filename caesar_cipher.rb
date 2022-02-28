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

puts 'What is your name?'
name = gets.chomp

puts "Hello, #{name}! I'd like to encrypt a message for you!"
puts 'Please enter a message for me to encrypt:'
string = gets.chomp

puts "Thanks for the message! I'll also need a shift amount for the cipher"
puts 'For example, a shift of 3 would make A into D, B into E, etc.'
puts 'Please enter a shift amount now:'
shift_amount = gets.chomp.to_i
encrypted_string = CaesarCipher.new(string, shift_amount).encrypted_string
puts "Done! Your encrypted message is '#{encrypted_string}'."
