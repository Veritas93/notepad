# Дочерний класс Link, который унаследовал основной функционал класа Post.
class Link < Post
  # Вызовем однаименный метод (initialize) родителя Post методом super
  def initialize
    super
    @url = "" # Добавили отличие от родительского класса переменную @url
  end
  # Метод считывания ввода пользователя с консоли.
  def read_from_console
    # Мы полностью переопределяем метод read_from_console родителя Post
    # Попросим у пользователя адрес ссылки
    puts "Введите адрес ссылки"
    @url = STDIN.gets.chomp
    # И описание ссылки (одной строкой)
    puts "Введите описание ссылки"
    @text = STDIN.gets.chomp
  end

  def save
    # Метод save во многом повторяет метод родителя, но отличается существенно
    file = File.new(file_path, "w:UTF-8")
    time_string = @create_at.strftime("%Y.%m.%d, %H:%M")
    file.puts(time_string + "\n\r")
    # Помимо текста мы еще сохраняем в файл фдрес ссылки.
    file.puts(@url)
    file.puts(@text)
    file.close
    # Напишем пользователю отклик о сохранении в файл.
    puts "Ваша ссылка сохранена"
  end  
end
