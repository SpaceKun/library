require "./validation.rb"
class Author
  include Validation_liberty

  def initialize(name, biography = nil)
    @name = valid_name?(name)
    @biography = biography
  end
end
