# frozen_string_literal: true

def cs_register
  print 'Введите слово. Пробелы будут удалены: '
  word = gets.chomp.gsub(/\s+/, '')
  if word.downcase[-2..] == 'cs'
    2**word.length
  else
    word.reverse
  end
end

# puts cs_register
