# Дочерний класс Memo, который унаследовал основной функционал класа Post.
class Memo < Post
  # Отдельный конструктор тут не нужен, так как он совпадает с родительским.
  # Метод считывания ввода пользователя с консоли.
  def read_from_console
    # Должен быть реализован классами-детьми
    # Метод будет спрашивать ввод описания заметки
  end
end