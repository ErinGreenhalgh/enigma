require './lib/enigma'

class Crack < Enigma

# attr_reader :cypher

  def find_cypher_end(cypher)
    cypher[-7..-1]
  end

  def find_cypher_indexes(cypher)
    find_index(find_cypher_end(cypher))
  end

  def find_plain_text_indexes
    find_index("..end..")
  end

  def find_corresponding_rotations_for_cypher
    corresponding_rotations = cypher.length % 4
    if corresponding_rotations == 0
      cypher[-4..-1]
    elsif corresponding_rotations == 1
      cypher[-5..-2]
    elsif corresponding_rotations == 2
      cypher[-6..-3]
    else
      cypher[-7..-4]
    end
  end

  # def find_rotation_for_character(cypher_character, plain_text_character)
  #   #for one character
  #   cypher_index = find_index(cypher_character)
  #   plain_text_index = find_index(plain_text_character)
  #   rotation_number =  plain_text_index - cypher_index
  # end

  def crack(cypher, date=Date.today)
    plain_text = message
    rotation_numbers = find_rotation_numbers(message)
    #find rotation numbers in order
  end

  def method_name
    find_rotation_for_character()
  end

end
