# frozen_string_literal: true

TASK_FILE = 'example.txt'
BUFFER = 'buffer.txt'

def index
  data_file = []
  File.foreach(TASK_FILE) do |line|
    data_file << line.chomp
  end
  data_file
end

def find(id)
  result = false
  find_line = ''
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if index == id
      find_line = line
      result = true
      break
    end
  end
  [find_line, result]
end

def where(pattern)
  hash_output = {}
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    hash_output[index] = line if line.chomp.include?(pattern)
  end
  hash_output
end

def update(id, text)
  result = false
  file = File.open(BUFFER, 'w')
  File.foreach(TASK_FILE).with_index(1) do |line, index|
    if id == index
      file.puts(text)
      result = true
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
