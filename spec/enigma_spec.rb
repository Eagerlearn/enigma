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

  xit '#encrypt' do
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it '#time_converter_for_encryption' do
    date_string_holder = []
    expected = (date_string_holder << Time.now.day.to_s
    date_string_holder << Time.now.month.to_s
    date_string_holder << Time.now.year.to_s.delete_prefix("20")
    date_string_holder.join)
    expect(@enigma.time_converter_for_date_string).to eq(expected)
  end

  it '#key_generator_for_encryption' do

    expect(@enigma.key_generator_for_encryption).not_to eq(nil)
  end
end