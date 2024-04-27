# frozen_string_literal: true

def foobar
  print 'Введите первое число. Ввод текста приравнивается к 0: '
  first_number = gets.chomp.to_i

  print 'Введите второе число: '
  second_number = gets.chomp.to_i

  if first_number == 20 || second_number == 20
    "Второе число = #{second_number}"
  else
    "Сумма чисел = #{first_number + second_number}"
  end
end

# puts foobar
