# frozen_string_literal: true

require_relative '../pokemons'
require 'rspec'

describe 'Test pokemons' do
  it 'Correct operation of the program' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('2', 'Бульбазавр', 'Голубовато-зелёный', 'Джигглипафф',
                                                               'Розовый')

    expect(pokemons).to eq(true)
  end

  it 'The number of Pokemon is 0' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('0')

    expect(pokemons).to eq(false)
  end

  it 'Empty string' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Pokemons')

    expect(pokemons).to eq(false)
  end
end
