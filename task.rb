# Дочерний класс Task, который унаследовал основной функционал класа Post запишем в новом файле task.rb.
# Подключим встроенный класс Date для работы с датой
require 'date'
class Task < Post
  # Дополним конструктор класса родительским конструктором.
  def initialize
    super # вызов конструктора родителя.
    @due_date = '' # - дедлайн
  end
  # Переопределим родительский метод класса Post.
  def read_from_console
    # Метод будет спрашивать 2 строки - описание задачи и дату дедлайна
    puts "Введите что вам нужно сделать?"
    @text = STDIN.gets.chomp
    # Спросим у пользователя уогда должна быть задача выполнена, подскажем формат ввода 
    puts "До какого числа вам нужно сделать эту задачу?"
    puts "Укажите дату формата ДД.ММ.ГГГГ"
    input = STDIN.gets.chomp

    # Для записи даты используем метод parse класса Time
    @due_date = Date.parse(input)
  end
  
  # Массив из трех строк: дедлайн, описание, дата создания
  def save 
    file = File.new(file_path, "w:UTF-8")
    time_string = @create_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")

    # Так как поле @due_date указывает на объект класса Date, мы можем вызвать метод strftime
    file.put("Сделать до #{@due_date.strftime("%Y.%m.%d")}")
    file.puts(@text)

    file.close

    # Напишем задача сохранена
    puts "Ваша задача сохранена."
  end
end
