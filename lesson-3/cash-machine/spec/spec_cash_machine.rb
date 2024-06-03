# frozen_string_literal: true

require_relative '../cash_machine'
require 'rspec'

describe 'Testing methods in the cash machine script' do
  let(:current_balance) { 100 }
  let(:deposit_amount) { '250' }
  let(:withdraw_amount) { '50' }

  before do
    File.write(TASK_FILE, 100)
  end

  it 'read_balance' do
    expect(read_balance).to eq(current_balance)
  end

  it 'quiet_machine' do
    expect(quiet_machine(current_balance)).to eq(false)
  end

  it 'deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(deposit_amount)
    expect(deposit(current_balance)).to eq(current_balance + deposit_amount.to_i)
  end

  it 'withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(withdraw_amount)
    expect(withdraw(current_balance)).to eq(current_balance - withdraw_amount.to_i)
  end
end
