require 'spec_helper'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_an_instance_of(Enigma)
  end

  it '#key_generator_for_encryption' do
    expect(@enigma.key_generator_for_encryption).not_to eq(nil)
  end

  it '#key_string_generator_for_encryption' do

    expect(@enigma.key_generator_for_encryption).not_to eq(nil)
  end

  it '#time_converter_for_encryption' do
    date_string_holder = []
    expected = (date_string_holder << Time.now.day.to_s
    date_string_holder << Time.now.month.to_s
    date_string_holder << Time.now.year.to_s.delete_prefix("20")
    date_string_holder.join)
    expect(@enigma.time_converter_for_date_string).to eq(expected)
  end

  it '#date_offset_maker' do
    expect(@enigma.date_offset_maker("040895")).to eq([1,0,2,5])
  end

  it '#key_converter' do
    expect(@enigma.key_converter("02715")).to eq([2, 27, 71, 15])
  end

  it '#encrypt' do
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    date = @enigma.time_converter_for_date_string
    expected_2 = {
                  encryption: "pkfawfqdzry",
                  key: "02715",
                  date: "151121"
                }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    expect(@enigma.encrypt("hello world", "02715")).to eq(expected_2)
    # expect(@enigma.encrypt("hello world")).not to_eq(nil)
  end

  it '#decrypt' do
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }
    date = @enigma.time_converter_for_date_string
    expected_2 = {
                  decryption: "hello world",
                  key: "02715",
                  date: date
                }
    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
  end
end

