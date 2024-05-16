# frozen_string_literal: true

require_relative '../cash_machine'
require 'rspec'

describe 'Testing methods in the cash machine script' do
  let(:current_balance) { 100 }
  let(:deposit_amount) { 250 }
  let(:withdraw_amount) { 50 }
  let(:cash_machine) { CashMachine.new }

  before do
    File.write(TASK_FILE, 100)
  end

  it 'deposit' do
    cash_machine.deposit(deposit_amount)
    expect(cash_machine.current_balance).to eq(current_balance + deposit_amount)
  end

  it 'withdraw' do
    cash_machine.withdraw(withdraw_amount)
    expect(cash_machine.current_balance).to eq(current_balance - withdraw_amount)
  end
end
