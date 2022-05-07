class Library
  include YAML
  include Validation

  def initialize(books, orders, readers, authors)
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
    validation_class!
  end

 books = YAML.load_file('./data/books.yml', permitted_classes: [Author, Book])
# books = Psych.load_file('./data/books.yml', permitted_classes: [Book, Author])
authors = Psych.load_file('./data/authors.yml', permitted_classes: [Author])
puts authors.first.name
puts books.first.name

  private

  def validation_class!
    validation_class(@boks, 'books', Book)
    validation_class(@orders, 'orders', Order)
    validation_class(@readers, 'readers', Reader)
    validation_class(@authors, 'authors', Author)
  end
end
