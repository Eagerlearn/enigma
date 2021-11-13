require 'date'

class Enigma
  def initialize
    @key_array = []
  end

  #if date is nil use today's date helper method
  def time_converter_for_date_string
    # require "pry"; binding.pry
    date_string_holder = []
    date_string_holder << Time.now.day.to_s
    date_string_holder << Time.now.month.to_s
    date_string_holder << Time.now.year.to_s.delete_prefix("20")
    date_string_holder.join
    # date_string_holder.join.to_i * date_string_holder.join.to_i
  end

  #if key is nil then generate random key helper method
  def key_generator_for_encryption
    # require "pry"; binding.pry
    sample_array = (0..9).to_a.sample, (0..9).to_a.sample,
                  (0..9).to_a.sample, (0..9).to_a.sample, (0..9).to_a.sample
    sample_array.join
  end

  # def encrypt(encryption, key = nil, date = nil)
  #
  #
  #   require "pry"; binding.pry
  # end
end