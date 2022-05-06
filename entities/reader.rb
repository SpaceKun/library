class Reader
  include Validation
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validation_length!
    validation_class!
  end

  private

  def validation_length!
    validation_length(@name, 1, 'name', String)
    validation_length(@email, 1, 'email', String)
    validation_length(@city, 1, 'city', String)
    validation_length(@street, 1, 'street', String)
    validation_length(@house, 1, 'house', Integer)
  end

  def validation_class!
    validation_class(@name, 'name', String)
    validation_class(@email, 'email', String)
    validation_class(@city, 'city', String)
    validation_class(@street, 'street', String)
    validation_class(@house, 'house', Integer)
  end
end
