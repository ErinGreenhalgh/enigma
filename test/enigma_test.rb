require 'simplecov'
SimpleCov.start

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'pry'

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
    assert_equal "7p9wv", enigma.encrypt("my ma", 12345, Date.parse("2012-04-03"))
  end

  def test_it_can_find_cypher_indexes
    enigma = Enigma.new
    assert_equal [33, 15, 35, 22, 21], enigma.find_index("7p9wv")
  end

  def test_it_can_find_plain_text_index
    enigma = Enigma.new
    assert_equal [12, 24, 36, 12, 0], enigma.find_plain_text_index([33, 15, 35, 22, 21], [21, 30, 38, 49])
  end

  def test_it_can_find_decrypted_characters
    enigma = Enigma.new
    assert_equal ["m", "y", " ", "m", "a"], enigma.decrypt_characters([12, -15, -3, -27, 0])
  end

  def test_it_can_decrypt_a_message
    enigma = Enigma.new
    assert_equal "my ma", enigma.decrypt("7p9wv", 12345, Date.parse("2012-04-03"))
  end

  def test_it_can_encrypt_with_only_the_message_and_key
    enigma = Enigma.new
    assert_equal "1i yp", enigma.encrypt("my ma", 12345)
  end

  def test_it_can_decrypt_with_only_the_message_and_key
    enigma = Enigma.new
    assert_equal "my ma", enigma.decrypt("1i yp", 12345)
  end

  def test_it_can_decrypt_horace_message
    enigma = Enigma.new
    assert_equal "messages are lost because allies can no", enigma.decrypt('3mu9rog9oitvotq9 fdvtiw9vfc22qg9okc4ovq', 14750)
  end

end
