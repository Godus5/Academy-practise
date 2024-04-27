# frozen_string_literal: true

require_relative '../foobar'
require 'rspec'

describe 'Test foobar' do
  it 'One number equals 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('20', '3')

    expect(foobar).to eq('Второе число = 3')
  end

  it 'No number is equal to 20' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('4', '3')

    expect(foobar).to eq('Сумма чисел = 7')
  end

  it 'Entering text in one of the fields' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('wasd', '3')

    expect(foobar).to eq('Сумма чисел = 3')
  end
end
