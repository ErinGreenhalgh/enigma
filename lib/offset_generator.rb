require 'pry'
require './lib/key_generator'
require 'date'

class OffsetGenerator

  def initialize(key= KeyGenerator.new , date= Date.today)
    @key = key
    @date = date
  end

  def generate_key_offsets
    key_numbers = @key.to_s.chars
    key_a = (key_numbers[0] + key_numbers[1]).to_i
    key_b = (key_numbers[1] + key_numbers[2]).to_i
    key_c = (key_numbers[2] + key_numbers[3]).to_i
    key_d = (key_numbers[3] + key_numbers[4]).to_i
    [key_a, key_b, key_c, key_d]
  end

  def format_date
    @date.strftime("%d%m%y")
  end

  def generate_date_offsets
    last_four_digits = ((format_date.to_i ** 2).to_s[-4..-1]).chars
    date_offsets = last_four_digits.map {|num| num.to_i}
  end

  def generate_rotations
    key_offsets = generate_key_offsets
    date_offsets = generate_date_offsets
    rotation_a = key_offsets[0] + date_offsets[0]
    rotation_b = key_offsets[1] + date_offsets[1]
    rotation_c = key_offsets[2] + date_offsets[2]
    rotation_d = key_offsets[3] + date_offsets[3]
    [rotation_a, rotation_b, rotation_c, rotation_d]
  end
end
