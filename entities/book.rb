class Book
include Validation
attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    validation_length!
    validation_class!
  end

  private

  def validation_length!
    validation_length(@title, 1, 'title', String)

  end

  def validation_class!
    validation_class(@title, 'title', String)
    validation_class(@author, 'author', Author)
  end
end
