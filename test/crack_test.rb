gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack.rb'

class CrackTest < Minitest::Test

  def test_it_can_find_the_cypher_indexes_in_the_character_map
    crack = Crack.new
    assert_equal [6, 0, 21, 30, 11, 0, 15], crack.find_cypher_indexes("gav4lap")
  end

  def test_it_can_find_the_plain_text_indexes_in_the_character_map
    crack = Crack.new
    assert_equal [37, 37, 4, 13, 3, 37, 37], crack.find_plain_text_indexes
  end

  def test_it_can_find_the_difference_between_cypher_and_plain_text_indexes
    crack = Crack.new
    
  end

  def test_it_can_find_rotation_numbers
    skip
    crack = Crack.new
    assert_equal
  end

  def test_it_can_crack_a_message_with_a_given_date
    skip
    crack = Crack.new
    assert_equal "my ma", enigma.crack("7p9wv", "030412")
  end

  def test_it_can_crack_a_message_assuming_todays_date
    skip
    crack = Crack.new
    assert_equal "my ma", enigma.crack("1i yp")
  end
end
