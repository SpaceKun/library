require './autoload'

library = Library.new

# library.add(Author.new('Seryoga', 'Gylik'))
# library.add(Author.new('Ser'))
# library.add(Book.new('Брюс всемогущий', library.authors.last))
# library.add(Reader.new('Rok', 'Rol@gmail.com', 'Dnipro', 'Kypol', 8))
# library.add(Order.new(library.books.last, library.readers.last, '18.07.21'))
# library.save!

# puts library.authors
# puts library.orders
# puts library.readers
# puts library.readers[0].name
# puts library.books
# puts library.orders.first.reader.name
puts library.top_book(1).title
# puts library.top_book(2).map { |book| book.title}
# puts library.top_reader(2).map { |reader| reader.name}

# puts library.count_readers_top_book(3)
