class Encryptor

def find_encrypted_index(message, rotations)
  character_indexes = find_index(message)
  character_indexes.map.with_index do |num, index|
    (num + rotations[index % 4]) % character_map.length
  end
end


  def encrypt_characters(encrypted_index)
    encrypted_index.map do |num|
      character_map[num]
    end
  end

  def encrypt(message, key=@key, date=Date.today)
    rotations= OffsetGenerator.new(key, date).generate_rotations
    encrypted_index = find_encrypted_index(message, rotations)
    encrypt_characters(encrypted_index).join
  end

end
