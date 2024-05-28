# frozen_string_literal: true

require_relative '../cash_machine'
require 'rspec'

describe 'Testing methods in the cash machine script' do
  let(:current_balance) { 100 }
  let(:deposit_amount) { '250' }
  let(:withdraw_amount) { '50' }
  let(:object) { CashMachine.new }

  before do
    File.write(TASK_FILE, 100)
  end

  it 'quiet_machine' do
    object.quiet_machine
    expect(object.current_balance).to eq(current_balance)
  end

  it 'deposit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(deposit_amount)
    object.deposit
    expect(object.current_balance).to eq(current_balance + deposit_amount.to_i)
  end

  it 'withdraw' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(withdraw_amount)
    object.withdraw
    expect(object.current_balance).to eq(current_balance - withdraw_amount.to_i)
  end
end
