def caesar_cipher(string, shift_amount)

  def get_cipher(letters, shift_amount)
    Hash[letters.zip(letters.rotate(shift_amount))]
  end

  lowercase_letters = [*('a'..'z')]
  uppercase_letters = [*('A'..'Z')]
  lowercase_cipher = get_cipher(lowercase_letters, shift_amount)
  uppercase_cipher = get_cipher(uppercase_letters, shift_amount)
  cipher = lowercase_cipher.merge(uppercase_cipher)
  string.chars.map {|char| cipher.fetch(char, char)}.join
end

puts "Please enter text to encrypt:"
string = gets.chomp

puts "Please enter a shift amount:"
shift_amount = gets.chomp.to_i

encrypted_string = caesar_cipher(string, shift_amount)

puts "Encrypted string: #{encrypted_string}"
