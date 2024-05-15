# frozen_string_literal: true

TASK_FILE = 'balance.txt'
DEFAULT_BALANCE = 100

# A class that simulates the behavior of an ATM
class CashMachine
  attr_reader :current_balance

  def initialize
    @current_balance = if File.exist?(TASK_FILE)
                         File.read(TASK_FILE).chomp.to_i
                       else
                         DEFAULT_BALANCE
                       end
  end

  def deposit(deposit_amount)
    if deposit_amount <= 0
      'Invalid amount entered. It must be greater than 0.'
    else
      @current_balance += deposit_amount
      File.write(TASK_FILE, @current_balance)
      "\nDeposit accepted.\nCurrent balance: #{@current_balance}"
    end
  end

  def withdraw(withdraw_amount)
    if withdraw_amount <= 0 || withdraw_amount > @current_balance
      'Invalid amount entered. It must be > 0 and <= current balance.'
    else
      @current_balance -= withdraw_amount
      File.write(TASK_FILE, @current_balance)
      "\nFunds have been withdrawn.\nCurrent balance: #{@current_balance}"
    end
  end
end
