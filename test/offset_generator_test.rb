gem 'minitest', '~> 5.2'
# require 'simplecov'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offset_generator.rb'

class OffsetGeneratorTest < Minitest::Test
  def test_it_can_create_a_new_offset_generator_object
    offset = OffsetGenerator.new
    assert_equal OffsetGenerator, offset.class
  end


  def test_it_can_generate_key_offsets
    offset = OffsetGenerator.new(12345, 2016-04-03)
    assert_equal [12, 23, 34, 45], offset.generate_key_offsets

  end

  def test_it_can_get_date_into_the_right_format
    skip 
    offset = OffsetGenerator.new(01234, 2016-04-04)
    assert_equal 40416, offset.get_date
  end

  def test_it_can_generate_date_offsets
    skip
    offset = OffsetGenerator.new
    offset.get_date
    assert_equal [], offset.generate_date_offsets

  end

  def test_it_can_create_final_offsets_from_key_and_date_offsets
    skip
    offset = OffsetGenerator.new
    offset.generate_key_offsets
    offset.get_date
    offset.generate_date_offsets
    assert_equal 12345, offset.generate_offsets
  end

end
