# frozen_string_literal: true

TASK_FILE = 'example.txt'
BUFFER = 'buffer.txt'

def index
  puts "\nСодержимое файла:\n"
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    puts "#{index}: #{line}"
  end
end

def find(id)
  flag = false
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if index == id
      puts "\nСтрока с номером #{id}: #{line}"
      flag = true
      break
    end
  end
  return if flag

  puts "\nСтроки с введённым номером не существует."
end

def where(pattern)
  hash_output = {}
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    hash_output[index] = line if line.chomp.include?(pattern)
  end
  if !hash_output.empty?
    puts "\nСтроки, содержащие введённый паттерн:"
    hash_output.each_key { |key| puts "#{key}: #{hash_output[key]}" }
  else
    puts "\nСтрок с введённым паттерном нет."
  end
end

def update(id, text)
  flag = false
  file = File.open(BUFFER, 'w')
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if id == index
      file.puts(text)
      flag = true
    else
      file.puts(line)
    end
  end
  file.close
  puts 'Строки с таким номером не существует.' unless flag
  File.write(TASK_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  flag = false
  file = File.open(BUFFER, 'w')
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if index != id
      file.puts(line)
    else
      flag = true
    end
  end
  file.close
  puts 'Строки с таким номером не существует.' unless flag
  File.write(TASK_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(name)
  File.open(TASK_FILE, 'a') do |file|
    file.puts(name)
  end
end
