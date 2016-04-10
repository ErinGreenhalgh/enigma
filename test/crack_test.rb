gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack.rb'

class CrackTest < Minitest::Test

  def test_it_can_find_the_index_of_a_character_in_the_character_map
    crack = Crack.new
    assert_equal 12, crack.find_index_in_character_map("m")
  end

  def test_it_can_find_the_rotation_number_for_one_character
    crack = Crack.new
    assert_equal 10, crack.find_rotation_for_character("w", "m")
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
