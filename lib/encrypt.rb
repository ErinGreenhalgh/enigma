require './lib/offset_generator'
require './lib/enigma'

e = Enigma.new
offset_generator = OffsetGenerator.new

handle = File.open(ARGV[0], "r")
handle.close

plain_text = handle.read.chomp
encrypted_text = e.encrypt(plain_text)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_text)
writer.close

key = e.key.generate
date = offset_generator.format_date
puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
