require './lib/enigma'

@enigma = Enigma.new


message_in = ARGV[0]
message_out = ARGV[1]

incoming_text = File.new(ARGV[0], "r")

final_hash = @enigma.encrypt(incoming_text)
File.open(ARGV[1], "w") do |file|
  file.puts final_hash[:encryption]
  puts "Created #{message_out} with the key #{final_hash[:key]} and date #{final_hash[:date]}"
end