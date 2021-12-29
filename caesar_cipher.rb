def caesar_cipher(string, shift_amount = 1)
  alphabet = Array('a'..'z')
  lowercase = Hash[alphabet.zip(alphabet.rotate(shift_amount))]

  alphabet = Array('A'..'Z')
  uppercase = Hash[alphabet.zip(alphabet.rotate(shift_amount))]

  cipher = lowercase.merge(uppercase)

  encrypted_string = string.chars.map { |char| cipher.fetch(char, char) }.join
  puts encrypted_string
end

caesar_cipher("Hello, World!", -50)
