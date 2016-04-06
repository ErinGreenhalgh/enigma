gem 'minitest', '~> 5.2'
# require 'simplecov'
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

  def test_it_can_get_date_into_the_right_format
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    assert_equal "030412", offset.format_date
  end

  #edge case: year like 2008 becomes 08 instead of 8

  def test_it_can_generate_date_offsets
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    offset.format_date
    assert_equal [9, 7, 4, 4], offset.generate_date_offsets
  end

  def test_it_can_create_final_rotations_from_key_and_date_offsets
    offset = OffsetGenerator.new(12345, Date.parse("2012-04-03"))
    # offset.generate_key_offsets
    # offset.generate_date_offsets
    #in pry these won't be called 
    assert_equal [21, 30, 38, 49], offset.generate_rotations
  end

end
