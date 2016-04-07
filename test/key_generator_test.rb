require 'simplecov'
SimpleCov.start

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_can_create_a_key_generator_object
    key = KeyGenerator.new
    assert_equal KeyGenerator, key.class
  end

  def test_it_returns_different_values
    key1 = KeyGenerator.new
    key2 = KeyGenerator.new
    refute_equal key1.generate, key2.generate
  end

  def test_it_returns_a_five_digit_number
    key = KeyGenerator.new
    assert_equal 5, key.generate.to_s.length
  end
  
end
