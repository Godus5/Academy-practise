# frozen_string_literal: true

def cs_register
  print 'Введите слово. Пробелы будут удалены: '
  word = gets.chomp.gsub(/\s+/, '')
  if word.downcase[-2..] == 'cs'
    puts 2**word.length
  else
    puts word.reverse
  end
end

# cs_register
