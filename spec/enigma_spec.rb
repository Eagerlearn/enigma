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
    expect(@enigma.key_generator_for_encryption).to be_a(Array)
    expect(@enigma.key_generator_for_encryption.length).to eq(4)
  end

  it '#key_string_generator_for_encryption' do

    expect(@enigma.key_string_generator_for_encryption).to be_a(String)
    expect(@enigma.key_string_generator_for_encryption.length).to eq(5)
  end

  it '#key_converter' do
    expect(@enigma.key_converter("02715")).to eq([2, 27, 71, 15])
    expect(@enigma.key_converter()).to be_a(Array)
    expect(@enigma.key_converter().length).to eq(4)
  end

  it '#time_converter_for_date_string' do
    expected = Date.today.strftime("%d%m%y")
    expect(@enigma.time_converter_for_date_string).to eq(expected)
    expect(@enigma.time_converter_for_date_string.length).to eq(6)
  end

  it '#date_offset_maker' do
    date = Date.today.strftime("%d%m%y")
    expect(@enigma.date_offset_maker("040895")).to eq([1,0,2,5])
    expect(@enigma.date_offset_maker(date)).to be_a(Array)
    expect(@enigma.date_offset_maker(date).length).to eq(4)
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
                  date: date
                }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    expect(@enigma.encrypt("hello world", "02715")).to eq(expected_2)
    expect(@enigma.encrypt("hello world")).to be_a(Hash)
    expect(@enigma.encrypt("hello world")[:key]).to be_a(String)
  end

  it '#decrypt' do
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }

    encrypted = @enigma.encrypt("hello world", "02715")
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    expect(@enigma.decrypt(encrypted[:encryption], "02715")).to be_a(Hash)
  end
end

