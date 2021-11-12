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
    expect(@enigma.time_converter_for_date_string).to eq("111121")
  end

  xit '#key_generator_for_encryption' do
    expect(@enigma.key_generator_for_encryption).to be(Integer)
  end
end