class Library
  include Storage
  include Statistical

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books
    @orders
    @readers
    @authors
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

  def top_book!( number_of_top)
    top_book(@order, number_of_top)
  end
end
