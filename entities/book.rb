class Book
  include Validation

  attr_reader :title, :author

  TITLE_MIN_LENGTH = 1

  def initialize(title, author)
    @title = title
    @author = author
    validate_class!
    validate_length!
  end

  def ==(other)
    if other.is_a? Book
      @title == other.title &&
        @author == other.author
    else
      false
    end
  end

  private

  def validate_length!
    validate_length(@title, 'title', String, min_length: TITLE_MIN_LENGTH)
  end

  def validate_class!
    validate_class(@title, 'title', String)
    validate_class(@author, 'author', Author)
  end
end
