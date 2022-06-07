class Book
  include Validation

  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validate_class!
    validate_length!
  end

  private

  def validate_length!
    validate_length(@title, 'title', String, min_length: 1)
  end

  def validate_class!
    validate_class(@title, 'title', String)
    validate_class(@author, 'author', Author)
  end
end
