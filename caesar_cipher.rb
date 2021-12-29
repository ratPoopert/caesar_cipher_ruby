def caesar_cipher(string, shift_amount = 1)
  alphabet = Array('a'..'z')
  lowercase = Hash[alphabet.zip(alphabet.rotate(shift_amount))]

  alphabet = Array('A'..'Z')
  uppercase = Hash[alphabet.zip(alphabet.rotate(shift_amount))]

  cipher = lowercase.merge(uppercase)

  encrypted_string = string.chars.map { |char| cipher.fetch(char, char) }.join
end

puts "Please enter text to encrypt:"
string = gets.chomp
puts "Please enter a shift amount:"
shift_amount = gets.chomp.to_i
encrypted_string = caesar_cipher(string, shift_amount)
puts "Encrypted string: #{encrypted_string}"
