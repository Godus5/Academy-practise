# frozen_string_literal: true

TASK_FILE = 'students_list.txt'
RESULT = 'results.txt'
BUFFER = 'buffer.txt'

def read_file
  students_list = []
  File.foreach(TASK_FILE) do |line|
    students_list << line.chomp
  end
  students_list
end

def set_search_age
  print 'Введите искомый возраст. Ввод "-1" приводит к завершению программы: '
  age = gets.chomp
  while age.to_i <= 0 && age.to_i != -1
    puts 'Некорректный ввод возраста.'
    print 'Введите искомый возраст. Ввод "-1" приводит к завершению программы: '
    age = gets.chomp
  end
  age
end

def search_by_list(students_list, search_age)
  index = 0
  while index < students_list.size
    if students_list[index].chomp[-2..] == search_age
      File.write(RESULT, "#{students_list[index]}\n", mode: 'a')
      students_list.delete_at(index)
    else
      index += 1
    end
  end
  students_list
end

def result
  result_data = []
  File.foreach(RESULT) do |line|
    result_data << line.chomp
  end
  result_data
end

def main
  students_list = read_file
  search_age = 0
  File.write(RESULT, '')
  while !students_list.empty? && search_age.to_i != -1
    search_age = set_search_age
    students_list = search_by_list(students_list, search_age)
    puts(students_list.empty? || search_age.to_i == -1 ? 'Завершение процесса поиска.' : 'Поиск завершен. Следующая итерация.')
  end
  result_data = result
  if result_data.empty?
    puts 'Результирующий файл пустой.'
  else
    puts 'Результат:'
    result_data.each { |line| puts line }
  end
end

# main
