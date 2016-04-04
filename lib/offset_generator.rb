require 'pry'
require '../lib/key_generator.rb'
require 'date'

class OffsetGenerator

  def initialize(key= KeyGenerator.new , date= Date.today)
    @key = key
    @key_offsets = []
    @date = Date.strptime(date, '%Y-%m-%d')
    @date_offsets = []
  end

  def generate_key_offsets
    key_numbers = @key.split
    key_a = (key_numbers[0] + key_numbers[1]).to_i
    key_b = (key_numbers[1] + key_numbers[2]).to_i
    key_c = (key_numbers[2] + key_numbers[3]).to_i
    key_d = (key_numbers[3] + key_numbers[4]).to_i
    @key_offsets << key_a << key_b << key_c << key_d
  end

  def get_date
    date_nums = @date.to_s.split("-")
    # binding.pry
    year_nums = date_nums.shift.chars
    2.times {year_nums.shift}
    year_nums = year_nums.join
    day_nums = date_nums.pop
    @date = date_nums.unshift(day_nums).push(year_nums).join.to_i
  end

  def generate_date_offsets(date)
    @date_offsets = ((@date ** 2).to_s[-4..-1]).chars
    @date_offsets = @date_offsets.map {|num| num.to_i}
  end

  def generate_offsets
    offset_a = @key_offsets[0] + @date_offsets[0]
    offset_b = @key_offsets[1] + @date_offsets[1]
    offset_c = @key_offsets[2] + @date_offsets[2]
    offset_d = @key_offsets[3] + @date_offsets[3]
    offsets = [offset_a, ]
  end
end
