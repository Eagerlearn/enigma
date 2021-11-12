require 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do
  before(:each) do
    @puzzle = Enigma.new
  end

  it 'exists' do
    expect(@puzzle).to be_an_instance_of(Enigma)
  end
end