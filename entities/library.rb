class Library
  include Add
  include Loader
  include Validation
  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = load_yaml_file("books.yml")
    @orders = load_yaml_file("orders.yml")
    @readers = load_yaml_file("readers.yml")
    @authors = load_yaml_file("authors.yml")
    # validate_class!
  end

  def save(name_library: , name_file:)
    name = name_file.downcase.delete('.yml')
    name_file = [name_library.authors.last].to_yaml
    file = File.open("./data/#{name}.yml", 'a') { |file| file.write(name_file)}
  end

  # private

  # def validate_class!
  #   validate_class(@boks, 'books', Book)
  #   validate_class(@orders, 'orders', Order)
  #   validate_class(@readers, 'readers', Reader)
  #   validate_class(@authors, 'authors', Author)
  # end
end
