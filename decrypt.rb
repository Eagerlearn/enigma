require './lib/enigma'

@enigma = Enigma.new


encrypted_in = ARGV[0]
decrypted_out = ARGV[1]
key = ARGV[2]
date = ARGV[3]

incoming_text = File.new(ARGV[0], "r")

final_hash = @enigma.decrypt(incoming_text, key, date)
File.open(ARGV[1], "w") do |file|
  file.puts final_hash[:decryption]
  puts "Created #{decrypted_out} with the key #{final_hash[:key]} and date #{final_hash[:date]}"
end