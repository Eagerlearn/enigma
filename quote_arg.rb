ARGV == ["quiet_quotes.txt", "loud_quotes.txt"]
ARGV[0] == "quiet_quotes.txt"
ARGV[1] == "loud_quotes.txt"

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

capitalized_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(capitalized_text)

writer.close