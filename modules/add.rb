module Add
  def add_author(name_library, name, biography = nil)
    name_library.authors << Author.new(name, biography)
  end

  def add_reader(name_library, name, email, city, street, house)
    name_library.readers << Reader.new(name, email, city, street, house)
  end

  def add_book(name_library, title, author)
    name_library.books << Book.new(title, author)
  end

  def add_order(name_library, book, reader, date)
    name_library.orders << Order.new(book, reader, date)
  end
end
