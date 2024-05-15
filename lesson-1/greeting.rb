# frozen_string_literal: true

def greeting
  print 'Введите своё имя: '
  name = gets.chomp
  print 'Введите свою фамилию: '
  last_name = gets.chomp
  print 'Введите ваш возраст: '
  age = gets.chomp.to_i
  while age <= 0
    puts 'Некорректный ввод возраста. Пожалуйста, введите значение больше 0.'
    print 'Введите ваш возраст: '
    age = gets.chomp.to_i
  end

  if age < 18
    "Привет, #{name} #{last_name}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано!"
  else
    "Привет, #{name} #{last_name}. Самое время заняться делом!"
  end
end

# puts greeting
