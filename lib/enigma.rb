require './lib/offset_generator'
require './lib/key_generator'
require 'pry'

class Enigma
  attr_reader :character_map, :key

  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9"," ", ".", ","]
      @key = KeyGenerator.new
  end

  def find_index(message)
    message_letters = message.downcase.chars
    message_indexes = message_letters.map do |letter|
      character_map.index(letter)
    end
  end

  def find_encrypted_index(message, rotations)
    character_indexes = find_index(message)
    character_indexes.map.with_index do |num, index|
      (num + rotations[index % 4]) % 39
    end
  end

  def encrypt_characters(encrypted_index)
    encrypted_index.map do |num|
      character_map[num]
    end
  end

  def find_plain_text_index(cypher_indexes, rotations)
    cypher_indexes.map.with_index do |num, index|
      (num - rotations[index % 4]) % 39
    end
  end

  def decrypt_characters(plain_characters)
    plain_characters.map do |num|
      character_map[num]
    end
  end


  def encrypt(message, key=@key, date=Date.today)
    rotations= OffsetGenerator.new(key, date).generate_rotations
    encrypted_index = find_encrypted_index(message, rotations)
    encrypt_characters(encrypted_index).join
  end

  def decrypt(message, key, date=Date.today)
    rotations= OffsetGenerator.new(key, date).generate_rotations
    cypher_indexes = find_index(message)
    plain_characters = find_plain_text_index(cypher_indexes, rotations)
    decrypt_characters(plain_characters).join
  end
end
