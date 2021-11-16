require 'date'

class Enigma
  # attr_reader :encrypted

  def initialize
    @alphabet_array = ("a".."z").to_a << " "
    #@key = key_generator_for_encryption
    # @encrypted = Hash.new()
  end
  # generate keys for encryption offset
  def key_generator_for_encryption
    key_string_array = []
    key_string_to_array = key_string_generator_for_encryption.each_char.to_a
    # require "pry"; binding.pry
    key_string_to_array.each_cons(2) do |pair|
      key_string_array << pair
    end
    keys_integer_array = key_string_array.map do |key|
      # require "pry"; binding.pry
      key.join.to_i
    end
    keys_integer_array
  end
  #if key is nil then generate string helper method
  def key_string_generator_for_encryption
    sample_key = rand(99999).to_s.rjust(5,"0")
  end
  #converts the incoming key, if given into an array
  def key_converter(key)
    string_array = []
    # require "pry"; binding.pry
    string_to_array = key.each_char.to_a
    string_to_array.each_cons(2) do |pair|
      string_array << pair
    end
    integer_array = string_array.map do |key|
      key.join.to_i
    end
    integer_array
  end
  #if date is nil use today's date helper method
  def time_converter_for_date_string
    date_converter = Date.today.strftime("%d%m%y")
  end
  #generates array with four elements to help with offset method
  def date_offset_maker(date)
    offset_array = []
    date_string = (date.to_i ** 2).to_s[-4..-1]

    offset_array << date_string[-4].to_i
    offset_array << date_string[-3].to_i
    offset_array << date_string[-2].to_i
    offset_array << date_string[-1].to_i
  end

  def encrypt(encryption, key = key_generator_for_encryption, date = time_converter_for_date_string)
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
    encrypted = {encryption: new_message_array.join, key: key, date: date}
  end

  def decrypt(decryption, key = key_generator_for_encryption, date = time_converter_for_date_string)
    new_message_array = []
    decrypt_array = decryption.split(//)
    dates = date_offset_maker(date)
    keys = key_converter(key)

    decrypt_array.each_with_index do |let, index|

      if index % 4 == 0
        first_letter = @alphabet_array.index(let) - (dates[0] + keys[0])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 1
        first_letter = @alphabet_array.index(let) - (dates[1] + keys[1])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 2
        first_letter = @alphabet_array.index(let) - (dates[2] + keys[2])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      elsif index % 4 == 3
        first_letter = @alphabet_array.index(let) - (dates[3] + keys[3])
        new_message_array << @alphabet_array.rotate(first_letter)[0]
      end
    end
    decrypted = {decryption: new_message_array.join, key: key, date: date}
  end
end