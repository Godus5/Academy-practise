# frozen_string_literal: true

TASK_FILE = 'example.txt'
BUFFER = 'buffer.txt'

def index
  puts "\nСодержимое файла:\n"
  File.foreach(TASK_FILE).with_index(1) do |line, idx|
    puts "#{idx}: #{line}"
  end
end

def find(id)
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if index == id
      puts "\nСтрока с номером #{id}: #{result_find[0]}"
      return
    end
  end
  puts "\nСтроки с введённым номером не существует."
end

def where(pattern)
  hash_output = {}
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    hash_output[index] = line if line.chomp.include?(pattern)
  end
  if hash_output.empty?
    puts "\nСтрок с введённым паттерном нет."
  else
    puts "\nСтроки, содержащие введённый паттерн:"
    hash_output.each { |key, value| puts "#{key}: #{value}" }
  end
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    file.puts(id == index ? text : line)
    if id == index
      file.puts(text)
      puts("Обновление строки #{id} произошло успешно.")
    else
      file.puts(line)
    end
  end
  file.close
  File.write(TASK_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  result
end

def delete(id)
  result = false
  file = File.open(BUFFER, 'w')
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if index != id
      file.puts(line)
    else
      result = true
    end
  end
  file.close
  File.write(TASK_FILE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  result
end

def create(name)
  File.open(TASK_FILE, 'a') do |file|
    file.puts(name)
  end
end
