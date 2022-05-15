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
    save(lib_entitie: @books, class_entitie: 'Book')
    save(lib_entitie: @orders, class_entitie: 'Order')
    save(lib_entitie: @readers, class_entitie: 'Reader')
    save(lib_entitie: @authors, class_entitie: 'Author')
  end

  def top_book(book)
    hash_orders = orders.group_by(&:book).map {|title_book, count_book| [title_book, count_book.length]}
    sort_orders = hash_orders.sort_by { |title_book, count_book| count_book }

    if book.is_a?(Integer) && book == 1
      sort_orders.reverse.first.detect {|title_book| title_book.is_a?(Book)}
    elsif book.is_a?(Integer)
    #  a = sort_orders.reverse.first(book).each { |x| x.delete_if { |i| i.is_a?(Integer) }}
    #  a.each { |x| x.detect {|title_book| title_book.is_a?(Book)}}
    end
  end
end

# def top_book(book)
#   hash_orders = orders.group_by(&:book).map {|title_book, count_book| [title_book, count_book.length]}
#   sort_orders = hash_orders.sort_by { |title_book, count_book| count_book }

#   if book.is_a?(Integer) && book == 1
#     sort_orders.reverse.first.delete_if { |i| i.is_a?(Integer) }
#   elsif book.is_a?(Integer)
#     sort_orders.reverse.first(book)
#   end
# end
