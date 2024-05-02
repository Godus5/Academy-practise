# frozen_string_literal: true

require_relative '../cs_register'
require 'rspec'

describe 'Test cs_register' do
  it 'Word ending in cs' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('Clinics')

    expect(cs_register).to eq(128)
  end

  it 'Word without ending cs' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('orteM')

    expect(cs_register).to eq('Metro')
  end

  it 'Empty string' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('')

    expect(cs_register).to eq('')
  end
end
