require './autoload'

library = Library.new

library.authors.push(Author.new('Seryoga', 'Gylik'))
library.authors.push(Author.new('Ser'))
library.books.push(Book.new('Брюс всемогущий', library.authors.last))

library.save!

# puts library.authors
# puts library.orders
# puts library.readers
# puts library.books
# puts library.orders.first.reader.name
 puts library.top_book(1)
# puts library.top_book(2).map { |book| book.title}
# puts library.top_reader(2).map { |reader| reader.name}

library.count_readers_top_book(3)
