gem 'minitest', '~> 5.2'
# require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/enigma.rb'

class EngimaTest < Minitest::Test

  def test_it_can_split_message_into_groups_of_4
  end


  def test_it_can_encrypt_a_message
    enigma = Enigma.new
    assert_equal "7p9wzjrk18", enigma.encrypt("my message", 12345, Date.parse("2012-04-03"))
  end
#edge case: message less than 4 letters long

  def test_it_can_decrypt_a_message
    skip
    enigma = Enigma.new
    enigma.decrypt
  end
end
