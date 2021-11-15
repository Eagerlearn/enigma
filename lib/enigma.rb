require 'date'

class Enigma
  def initialize
    @alphabet_array = ("a".."z").to_a << " "
    @key = key_generator_for_encryption
  end
  #compare message to alphabet_array for shift to do encryption

  # generate keys for encryption offset
  def key_generator_for_encryption
    key_string_array = []
    # require "pry"; binding.pry
    key_string_to_array = key_string_generator_for_encryption.each_char.to_a
    key_string_to_array.each_cons(2) do |pair|
      key_string_array << pair
    end
    keys_integer_array = key_string_array.map do |key|
      key.join.to_i
    end
    keys_integer_array
  end
  #if key is nil then generate string helper method
  def key_string_generator_for_encryption
    sample_key = rand(99999).to_s.rjust(5,"0")
    # (0..9).to_a.sample, (0..9).to_a.sample,
    # (0..9).to_a.sample, (0..9).to_a.sample, (0..9).to_a.sample
    # sample_array.join
  end
  #converts the incoming key, if given into an array
  def key_converter(key)
    key_string_array = []
    key_string_to_array = key.each_char.to_a
    key_string_to_array.each_cons(2) do |pair|
      key_string_array << pair
    end
    keys_integer_array = key_string_array.map do |key|
      key.join.to_i
    end
    keys_integer_array
  end
  #if date is nil use today's date helper method
  def time_converter_for_date_string
    date_converter = Date.today.strftime("%d%m%y")
    # date_string_holder = []
    # date_string_holder << Time.now.day.to_s
    # date_string_holder << Time.now.month.to_s
    # date_string_holder << Time.now.year.to_s[-2..-1]
    # date_string_holder.join
  end
  #generates array with four elements to help with offset method
  def date_offset_maker(date)
    offset_array = []
    date_string = (date.to_i ** 2).to_s[-4..-1]

    # require "pry"; binding.pry
    offset_array << date_string[-4].to_i
    offset_array << date_string[-3].to_i
    offset_array << date_string[-2].to_i
    offset_array << date_string[-1].to_i
  end

  # def shift(date)
  #   require "pry"; binding.pry
  # end

  def encrypt(encryption, key = @key, date = time_converter_for_encryption)
    new_message_array = []
    encrypt_array = encryption.split(//)
    dates = date_offset_maker(date)
    keys = key_converter(key)

    encrypt_array.each_with_index do |let, index|

      if index % 4 == 0
        first_letter = @alphabet_array.index(let) + (dates[0] + keys[0])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 1
        first_letter = @alphabet_array.index(let) + (dates[1] + keys[1])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 2
        first_letter = @alphabet_array.index(let) + (dates[2] + keys[2])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 3
        first_letter = @alphabet_array.index(let) + (dates[3] + keys[3])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      end
    end
    encrypted_hash = {encryption: new_message_array.join, key: key, date: date}
  end
end