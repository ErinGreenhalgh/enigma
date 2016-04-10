class Crack
  attr_reader :character_map
  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9"," ", ".", ","]
      # @key = KeyGenerator.new
  end

  def find_index_in_character_map(character)
    character_map.index(character)
  end

  def find_rotation_for_character(cypher_character, plain_text_character)
    #for one character
    cypher_index = find_index_in_character_map(cypher_character)
    plain_text_index = find_index_in_character_map(plain_text_character)
    rotation_number = plain_text_index - cypher_index  
    # until rotation_number > 0
    #   rotation_number += character_map.length #39
    # end
  end

  def crack(cypher, date=Date.today)
    plain_text = message
    rotation_numbers = find_rotation_numbers(message)
    #find rotation numbers in order
  end



  def method_name
    find_rotation_for_character()
  end

end
