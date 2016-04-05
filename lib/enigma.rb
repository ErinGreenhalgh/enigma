require_relative 'offset_generator.rb'
require 'pry'

class Enigma

  def initialize
    @char_map = [abcdefghijklmnopqrstuvwxyz0123456789 .,]
    @offset = OffsetGenerator.new
  end

  def encrypt(message, key, date)
    
  end
end
