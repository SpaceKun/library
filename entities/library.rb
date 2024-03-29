class Library
  include Storage

  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = load_yaml_file(name_file: 'books.yml')
    @orders = load_yaml_file(name_file: 'orders.yml')
    @readers = load_yaml_file(name_file: 'readers.yml')
    @authors = load_yaml_file(name_file: 'authors.yml')
  end

  def add(value)
    validate_duplication!(value)
    case value
    when Author then @authors.push(value) unless @authors.include?(value)
    when Book then @books.push(value) unless @books.include?(value)
    when Reader then @readers.push(value) unless @readers.include?(value)
    when Order then @orders.push(value) unless @orders.include?(value)
    else raise ArgumentError.new, 'wrong class passed'
    end
  end

  def save!
    save(lib_entities: @books, class_entity: 'Book')
    save(lib_entities: @orders, class_entity: 'Order')
    save(lib_entities: @readers, class_entity: 'Reader')
    save(lib_entities: @authors, class_entity: 'Author')
  end

  def top_reader(count = 1)
    orders.group_by(&:reader)
          .max_by(count) { |_k, v| v.count }
          .to_h
          .keys
  end

  def top_book(count = 1)
    orders.group_by(&:book)
          .max_by(count) { |_k, v| v.count }
          .to_h
          .keys
  end

  def count_readers_top_book(count = 3)
    top_book_title = top_book(count).map(&:title)
    orders_with_top_book = orders.select do |order|
      top_book_title.include?(order.book.title)
    end
    orders_with_top_book.map(&:reader).uniq(&:email).count
  end

  private

  def validate_duplication!(value)
    if [@authors, @books, @readers, @orders].flatten.include?(value)
      warn ArgumentError.new "This item (#{value}) has already been saved to the database."
    end
  end
end
