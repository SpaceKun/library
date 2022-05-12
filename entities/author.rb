class Author
  include Validation
  attr_reader :name
  attr_accessor :biography

  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    validate_length!
    validate_class!
  end

  def to_s
    "Автор: #{name}"
  end

  private

  def validate_length!
    validate_length(@name, 'name', String, min_length: 1)
  end

  def validate_class!
    validate_class(@name, 'name', String)
    validate_class(@biography, 'biography', String)
  end
end
