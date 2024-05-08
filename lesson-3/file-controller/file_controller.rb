# frozen_string_literal: true

require_relative 'method_file_controller'

def interface
  flag = true
  while flag
    puts "\nВыберите действие для работы с файлом. Ввод текста считается 0."
    puts '1 - index'
    puts '2 - find'
    puts '3 - where'
    puts '4 - update'
    puts '5 - delete'
    puts '6 - create'
    puts '0 - выход из программы'
    print 'Ваш выбор: '
    mode = gets.chomp.to_i

    case mode
    when 1..5
      if File.exist?(TASK_FILE) && !File.zero?(TASK_FILE)
        case mode
        when 1
          index
        when 2
          print 'Введите номер искомой строки. Текст приравнивается к 0: '
          id = gets.chomp.to_i
          while id <= 0
            puts 'Некорректный ввод искомой строки. Пожалуйста, введите значение больше 0.'
            print 'Введите номер искомой строки. Текст приравнивается к 0: '
            id = gets.chomp.to_i
          end
          find(id)
        when 3
          print 'Введите паттерн для поиска строки. Пустая строка является некорректным вводом: '
          pattern = gets.chomp
          while pattern.empty?
            puts 'Некорректный ввод паттерна.'
            print 'Введите паттерн для поиска строки. Пустая строка является некорректным вводом: '
            pattern = gets.chomp
          end
          where(pattern)
        when 4
          print 'Введите номер искомой строки. Текст приравнивается к 0: '
          id = gets.chomp.to_i
          while id <= 0
            puts 'Некорректный ввод искомой строки. Пожалуйста, введите значение больше 0.'
            print 'Введите номер искомой строки. Текст приравнивается к 0: '
            id = gets.chomp.to_i
          end
          print 'Введите новый текст для искомой строки: '
          text = gets
          update(id, text)
        when 5
          print 'Введите номер искомой строки. Текст приравнивается к 0: '
          id = gets.chomp.to_i
          while id <= 0
            puts 'Некорректный ввод искомой строки. Пожалуйста, введите значение больше 0.'
            print 'Введите номер искомой строки. Текст приравнивается к 0: '
            id = gets.chomp.to_i
          end
          delete(id)
        end
      else
        puts 'Файл пуст или не существует. Пожалуйста, исправьте проблему для дальнешей работы программы, либо запустите команду: create'
      end
    when 6
      print 'Введите текст для новой строки. Если файла не существует, то в начало будет добавлена пустая строка: '
      text = gets.chomp
      create(text)
    when 0
      puts 'Программа завершена.'
      flag = false
    else
      puts 'Такой команды нет в списке. Пожалуйста, введите один из предложенных вариантов.'
    end
  end
end

# interface
