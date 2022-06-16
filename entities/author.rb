class Author
  include Validation
  attr_reader :name
  attr_accessor :biography

  NAME_MIN_LENGTH = 1

  def initialize(name, biography = '')
    @name = name
    @biography = biography
    validate_class!
    validate_length!
  end

  def ==(other)
    if other.is_a? Author
      @name == other.name &&
      @biography == other.biography
    else
      false
    end
  end

  private

  def validate_length!
    validate_length(@name, 'name', String, min_length: NAME_MIN_LENGTH)
  end

  def validate_class!
    validate_class(@name, 'name', String)
    validate_class(@biography, 'biography', String)
  end
end
