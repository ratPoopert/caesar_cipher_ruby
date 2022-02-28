# frozen_string_literal: true

require './lib/caesar_cipher.rb'

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
