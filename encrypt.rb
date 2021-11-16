require './lib/enigma'

@enigma = Enigma.new

ARGV == ["message_to_encrypt.txt", "encrypted_message.txt"]
ARGV[0] == "message_to_encrypt.txt"
ARGV[1] == "encrypted_message.txt"



handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close
require "pry"; binding.pry

encrypted_text = incoming_text

writer = File.open(ARGV[1], "w")

writer.write(encrypted_text)

writer.close

puts "Created 'encrypted.txt' with the key #{key} and date #{date}"