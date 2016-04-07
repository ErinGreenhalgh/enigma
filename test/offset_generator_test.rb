require 'simplecov'
SimpleCov.start

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test

  def test_it_can_create_a_new_offset_generator_object
    offset = OffsetGenerator.new
    assert_equal OffsetGenerator, offset.class
  end

  def test_it_can_generate_key_offsets
    offset = OffsetGenerator.new(12345)
    assert_equal [12, 23, 34, 45], offset.generate_key_offsets
  end

  def test_it_can_receive_date_as_a_date_object
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    assert_equal "030412", offset.format_date
  end

  def test_it_can_receive_date_as_a_string
    offset = OffsetGenerator.new(12345, "030412")
    assert_equal "030412", offset.format_date
  end

  def test_it_can_generate_date_offsets
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    offset.format_date
    assert_equal [9, 7, 4, 4], offset.generate_date_offsets
  end

  def test_it_can_create_final_rotations_from_key_and_date_offsets
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    assert_equal [21, 30, 38, 49], offset.generate_rotations
  end

end
