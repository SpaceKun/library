class Library
  include Storage

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
    load!
  end

  def load!
    @books = load_yaml_file(name_file: 'books.yml')
    @orders = load_yaml_file(name_file: 'orders.yml')
    @readers = load_yaml_file(name_file: 'readers.yml')
    @authors = load_yaml_file(name_file: 'authors.yml')
  end

  def save!
    save(lib_entitie: @books, class_entitie: 'Book')
    save(lib_entitie: @orders, class_entitie: 'Order')
    save(lib_entitie: @readers, class_entitie: 'Reader')
    save(lib_entitie: @authors, class_entitie: 'Author')
  end
end
