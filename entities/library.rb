class Library
  include Storage

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = load_yaml_file(name_file: 'books.yml')
    @orders = load_yaml_file(name_file: 'orders.yml')
    @readers = load_yaml_file(name_file: 'readers.yml')
    @authors = load_yaml_file(name_file: 'authors.yml')
  end

  def save!
    save(lib_entities: @books, class_entities: 'Book')
    save(lib_entities: @orders, class_entities: 'Order')
    save(lib_entities: @readers, class_entities: 'Reader')
    save(lib_entities: @authors, class_entities: 'Author')
  end

  def top_reader(count = 1)
    orders.group_by(&:reader)
          .transform_values(&:length)
          .sort_by { |_k, v| v }
          .reverse
          .to_h
          .keys
          .first(count)
  end

  def top_book(count = 1)
    orders.group_by(&:book)
          .transform_values(&:length)
          .sort_by { |_k, v| v }
          .reverse
          .to_h
          .keys
          .first(count)
  end
end
