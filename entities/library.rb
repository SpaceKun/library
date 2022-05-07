class Library
  include Validation

  def initialize(books, orders, readers, authors)
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
    validation_class!
  end

  private

  def validation_class!
    validation_class(@boks, 'books', Book)
    validation_class(@orders, 'orders', Order)
    validation_class(@readers, 'readers', Reader)
    validation_class(@authors, 'authors', Author)
  end
end
