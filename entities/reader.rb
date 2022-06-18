class Reader
  include Validation
  attr_accessor :name, :email, :city, :street, :house

  NAME_MIN_LENGTH = 1
  EMAIL_MIN_LENGTH = 3
  CITY_MIN_LENGTH = 1
  STREET_MIN_LENGTH = 1

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate_class!
    validate_length!
    validate_positive!
  end

  def ==(other)
    if other.is_a? Reader
      @name == other.name &&
        @email == other.email &&
        @city == other.city &&
        @street == other.street &&
        @house == other.house
    else
      false
    end
  end

  private

  def validate_length!
    validate_length(@name, 'name', String, min_length: NAME_MIN_LENGTH)
    validate_length(@email, 'email', String, min_length: EMAIL_MIN_LENGTH)
    validate_length(@city, 'city', String, min_length: CITY_MIN_LENGTH)
    validate_length(@street, 'street', String, min_length: STREET_MIN_LENGTH)
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
