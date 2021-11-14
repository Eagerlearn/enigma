require 'spec_helper'
require 'date'
require './lib/enigma'
require './lib/keys'

RSpec.describe Keys do
  before(:each) do
    @keys = Keys.new
  end

  it 'exists' do
    expect(@keys).to be_an_instance_of(Keys)
  end
end