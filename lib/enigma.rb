class Enigma
  def initialize
  end

  # def encrypt(encryption, key = nil, date = nil)
  #
  #
  #   require "pry"; binding.pry
  # end

  #if date is nil use today's date
  def time_converter_for_date_string
    date_string_holder = []
    date_string_holder << Time.now.day.to_s
    date_string_holder << Time.now.month.to_s
    date_string_holder << Time.now.year.to_s.delete_prefix("20")
    date_string_holder.join
    # date_string_holder.join.to_i * date_string_holder.join.to_i
  end

  #if key is nil then generate random key
  # def key_generator_for_encryption
  #
  # end
end