# frozen_string_literal: true

TASK_FILE = 'balance.txt'
DEFAULT_BALANCE = 100

def read_balance
  if File.exist?(TASK_FILE)
    File.read(TASK_FILE).chomp.to_i
  else
    DEFAULT_BALANCE
  end
end

def quiet_machine(current_balance)
  puts "\nПрограмма завершена.\nТекущий баланс: #{current_balance}"
  File.write(TASK_FILE, current_balance)
  false
end

def deposit(current_balance)
  print "\nВведите сумму депозита: "
  deposit_amount = gets.chomp.to_i
  while deposit_amount <= 0
    puts 'Некорректный ввод суммы. Она должна быть больше 0.'
    print "\nВведите сумму депозита: "
    deposit_amount = gets.chomp.to_i
  end
  puts "\nДепозит принят.\nТекущий баланс: #{current_balance + deposit_amount}"
  current_balance + deposit_amount
end

def withdraw(current_balance)
  print "\nВведите сумму для снятия средств: "
  withdraw_amount = gets.chomp.to_i
  while withdraw_amount <= 0 || withdraw_amount > current_balance
    puts 'Некорректный ввод суммы. Она должна быть > 0 и <= текущего баланса.'
    puts "Текущий баланс: #{current_balance}"
    print "\nВведите сумму депозита: "
    withdraw_amount = gets.chomp.to_i
  end
  puts "\nСредства сняты.\nТекущий баланс: #{current_balance - withdraw_amount}"
  current_balance - withdraw_amount
end

def main
  current_balance = read_balance
  flag = true
  while flag
    puts "\nВыберите функцию банкомата путём ввода первой буквы."
    puts 'D - deposit'
    puts 'W - withdraw'
    puts 'B - balance'
    puts 'Q - quiet'
    print 'Ваш выбор: '
    mode = gets.chomp.downcase.to_sym
    case mode
    when :d
      current_balance = deposit(current_balance)
    when :w
      current_balance = withdraw(current_balance)
    when :b
      puts "\nТекущий баланс: #{current_balance}"
    when :q
      flag = quiet_machine(current_balance)
    else
      puts "\nНекорректный ввод команды.\nПожалуйста, выберите один из предложенных вариантов."
    end
  end
end

# main
