require 'date'

class Enigma
  def initialize
    @alphabet_array = ("a".."z").to_a << " "
  end

  #compare message to alphabet_array for shift to do encryption
  def encryption_helper
  end
  #if date is nil use today's date helper method
  def time_converter_for_date_string
    date_string_holder = []
    date_string_holder << Time.now.day.to_s
    date_string_holder << Time.now.month.to_s
    date_string_holder << Time.now.year.to_s[-2..-1]
    date_string_holder.join
  end

  #if key is nil then generate random key helper method
  def key_generator_for_encryption
    sample_array = (0..9).to_a.sample, (0..9).to_a.sample,
                  (0..9).to_a.sample, (0..9).to_a.sample, (0..9).to_a.sample
    sample_array.join
  end

  def encrypt(encryption, key = nil, date = nil)
    encrypt_hash = Hash.new(0)

    if key == nil && date == nil
      encrypt_hash = {encryption: encryption, key: key_generator_for_encryption, date: time_converter_for_date_string}
    elsif key == nil && date != nil
      encrypt_hash = {encryption: encryption, key: key_generator_for_encryption, date: date}
    elsif key != nil && date == nil
      encrypt_hash = {encryption: encryption, key: key, date: time_converter_for_date_string}
    else
      encrypt_hash = {encryption: encryption, key: key, date: date}



    # key_generator_for_encryption
    # time_converter_for_encryption
    # encrypt_hash
    require "pry"; binding.pry
  end
end