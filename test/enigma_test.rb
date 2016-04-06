gem 'minitest', '~> 5.2'
# require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EngimaTest < Minitest::Test

  def test_it_it_can_find_corresponding_index_in_character_map
    enigma = Enigma.new
    assert_equal [12, 24, 36, 12, 0], enigma.find_index("my ma")
  end
#edgecase: message includes caps
  def test_it_can_find_encrypted_index
    enigma = Enigma.new
    assert_equal [33, 15, 35, 22, 21], enigma.find_encrypted_index("my ma", [21, 30, 38, 49])
  end

  def test_it_can_find_encrypted_characters
    enigma = Enigma.new
    assert_equal ["7", "p", "9", "w", "v"], enigma.encrypt_characters([33, 15, 35, 22, 21])
  end

  def test_it_can_encrypt_a_message
    enigma = Enigma.new
    assert_equal "7p9wv", enigma.encrypt("my ma") #12345, Date.parse("2012-04-03"))
  end
#edge case: message less than 4 letters long

  def test_it_can_find_cypher_indexes
    enigma = Enigma.new
    assert_equal [33, 15, 35, 22, 21], enigma.find_index("7p9wv")
  end

  def test_it_can_find_plain_text_index
    enigma = Enigma.new
    assert_equal [12, -15, -3, -27, 0], enigma.find_plain_text_index("7p9wv", [21, 30, 38, 49])
  end

  def test_it_can_find_decrypted_characters
    enigma = Enigma.new
    assert_equal ["m", "y", " ", "m", "a"], enigma.decrypt_characters([12, -15, -3, -27, -28])
  end

  def test_it_can_decrypt_a_message
    skip
    enigma = Enigma.new
    assert_equal "my ma", enigma.decrypt("7p9wv")
  end
end
