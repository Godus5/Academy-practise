# frozen_string_literal: true

def pokemons
  print 'Введите количество покемонов. Ввод текста приравнивается к 0: '
  number_of_pokemon = gets.chomp.to_i
  if number_of_pokemon.zero?
    puts 'Массив покемонов пуст.'
    false
  else
    pokemon_array = []
    number_of_pokemon.times do |pokemon_index|
      puts "Покемон #{pokemon_index + 1}."
      print 'Введите имя: '
      name = gets.chomp
      print 'Введите цвет: '
      color = gets.chomp
      pokemon_array << { name: name, color: color }
    end
    puts "\nМассив покемонов:"
    p pokemon_array
    true
  end
end

# pokemons
