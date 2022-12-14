# Базовый класс "Запись" создадим проект notepad  и файл post.rb
# Задает основные методы и свойства, присущие всем разновидностям Записи

class Post
  # Все методы объявленные в классе родителей называются интерфейсом класса. 
  # конструктор
  def initialize
    @created_at = Time.now
    @text = []
  end
  
  # Создадим статический метод post_types который будет выводить ассоциативный массив всех детей этого класса. 
  def self.post_types
    [Memo, Task, Link]
  end
  
  # Создадим статический метод create который будет выволнять динамическое создание объекта нужного класса из набора возможных детей.
  def self.create(type_index)
    return post_types[type_index].new
  end
  
  # Метод абстрактный  считывания ввода пользователя с консоли.
  def read_from_console
    # Должен быть реализован классами-детьми
  end
  
  # Метод абстрактный возвращает состояние объекта в виде массива строк готовых к записи в файл.
  def to_strings
    # Должен быть реализован классами-детьми
  end
  
  # Метод возвращает состояние объекта в файл, будет только у родителя 
  def save
    file = File.new(file_path, "w:UTF-8") # открываем файл на запись.
    for item in to_string do # идем по массиву строк, получаемых из метода to_strings
      file.puts(item)
    end
    file.close # закрываем файл
  end
  
  # Служебный метод,который будет возвращать, куда сохранять файл заметки.
  def file_path
    # В переменной file_path сохраним место, откуда запустили программу.
    current_path = File.dirname(__File__)
    # Получим имя файла из даты создания поста метод strftime
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
    return current_path + "/" + file_name
  end
end




