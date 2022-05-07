class Author
include Validation
attr_accessor :name, :biography

  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    validation_length!
    validation_class!
  end

  private

  def validation_length!
    validation_length(@name, 1, 'name', String)

  end

  def validation_class!
    validation_class(@name, 'name', String)
    validation_class(@biography, 'biography', String)
  end
end
