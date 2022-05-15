class Book
  include Validation

  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate_length!
    validate_class!
  end

  # def to_s
  #   "Название книги: #{title}, автора: #{author}"
  # end

  private

  def validate_length!
    validate_length(@title, 'title', String, min_length: 1)
  end

  def validate_class!
    validate_class(@title, 'title', String)
    validate_class(@author, 'author', Author)
  end
end
