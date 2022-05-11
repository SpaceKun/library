class Reader
  include Validation
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate_length!
    validate_class!
    validate_positive!
  end

  private

  def validate_length!
    validate_length(@name, 'name', String, min_length: 1)
    validate_length(@email, 'email', String, min_length: 1)
    validate_length(@city, 'city', String, min_length: 1)
    validate_length(@street, 'street', String, min_length: 1)
  end

  def validate_class!
    validate_class(@name, 'name', String)
    validate_class(@email, 'email', String)
    validate_class(@city, 'city', String)
    validate_class(@street, 'street', String)
    validate_class(@house, 'house', Integer)
  end

  def validate_positive!
    validate_positive(@house, 'house')
  end
end
