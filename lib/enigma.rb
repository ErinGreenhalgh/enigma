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

end
