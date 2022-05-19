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
          .max_by(count) { |_k, v| v.count }
          .to_h
          .keys
  end

  def top_book(count = 1)
    top(count, :book)
  end

  def count_readers_top_book(count = 3)
    top_book_all_orders = orders.group_by(&:book).max_by(count) { |_k, v| v.count }
    top_book_all_orders.each do |book, orders|
      num_readers = orders.map(&:reader).uniq.count
      book = book.title
      puts "#{book} has #{num_readers} readers"
    end
  end
  private

  def top(count, :entity)
    orders.group_by(&:entity)
          .max_by(count) { |_k, v| v.count }
          .to_h
          .keys
  end


end
