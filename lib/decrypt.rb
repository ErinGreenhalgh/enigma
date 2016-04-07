require './lib/offset_generator'
require './lib/enigma'

e = Enigma.new

handle = File.open(ARGV[0], "r")
encrypted_text = handle.read.chomp
handle.close

plain_text = e.decrypt(encrypted_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(plain_text)
writer.close

key = ARGV[2]
date = ARGV[3]
puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
