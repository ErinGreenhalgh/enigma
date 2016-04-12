require './lib/enigma'
class Decryptor

  def find_plain_text_index(cypher_indexes, rotations)
    cypher_indexes.map.with_index do |num, index|
      (num - rotations[index % 4]) % character_map.length
    end
  end

  def decrypt_characters(plain_characters)
    plain_characters.map do |num|
      character_map[num]
    end
  end

  def decrypt(message, key, date=Date.today)
    rotations= OffsetGenerator.new(key, date).generate_rotations
    cypher_indexes = find_index(message)
    plain_characters = find_plain_text_index(cypher_indexes, rotations)
    decrypt_characters(plain_characters).join
  end

end
