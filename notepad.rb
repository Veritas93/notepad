# Подключаем класс Post и его детей в файле notepad.rb
require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

puts "Привет я блокнот!"

puts "Что хотите записать в блокноте?"

# Массив возможных видов Записи
choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size # пока пользователь не выбрал правильный ответ.
  # Выводим звноыо массив возможных типов поста
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = gets.chomp.to-i

  #  выбор сделан, создаем запись с помощью стат. метод класса Post

  entry = Post.create(choice)

  # Сейчас в переменной entry лежит один из детей класса Post. который определил пользовател. но мы не знаем его выбор, и обращаемся к нему как к объекту класса Post.

  # Просим позьзователя ввести пост
  entry.read_from_console

  entry.save

  puts "Ваша запись сохранена!"
