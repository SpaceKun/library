class Book
include Validation
attr_accessor :title, :autor

  def initialize(title, autor)
    @title = title
    @autor = autor
    validation_length!
    validation_class!
  end

  private

  def validation_length!
    validation_length(@title, 1, 'title', String)

  end

  def validation_class!
    validation_class(@title, 'title', String)
  end
end
