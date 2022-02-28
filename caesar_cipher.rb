def caesar_cipher(string, shift_amount)

  lowercase_letters = [*("a".."z")]
  uppercase_letters = [*("A".."Z")]

  def get_cipher(letters, shift_amount)
    Hash[letters.zip(letters.rotate(shift_amount))]
  end

  def encrypt_string(string, cipher)
    string.chars.map{|char| cipher.fetch(char, char)}.join
  end
  
  lowercase_cipher = get_cipher(lowercase_letters, shift_amount) 
  uppercase_cipher = get_cipher(uppercase_letters, shift_amount) 
  cipher = lowercase_cipher.merge(uppercase_cipher)

  encrypted_string = encrypt_string(string, cipher)
  
end

puts "What is your name?"
name = gets.chomp

puts "Hello, #{name}! I'd like to encrypt a message for you!"
puts "Please enter a message for me to encrypt:"
string = gets.chomp

puts "Thanks for the message! I'll also need a shift amount for the cipher"
puts "For example, a shift of 3 would make A into D, B into E, etc."
puts "Please enter a shift amount now:"
shift_amount = gets.chomp.to_i
encrypted_string = caesar_cipher(string, shift_amount)
puts "Done! Your encrypted message is '#{encrypted_string}'."
