# frozen_string_literal: true

require_relative '../greeting'
require 'rspec'

describe 'Test greeting' do
  it 'Age greater than or equal to 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Антон', 'Хашабов', '18')

    expect(greeting).to eq('Привет, Антон Хашабов. Самое время заняться делом!')
  end

  it 'Age under 18' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Антон', 'Хашабов', '16')

    expect(greeting).to eq('Привет, Антон Хашабов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!')
  end

  it 'Incorrect age entry and subsequent correction' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Антон', 'Хашабов', 'wasd', '17')

    expect(greeting).to eq('Привет, Антон Хашабов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!')
  end
end
