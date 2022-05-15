require './autoload'

library = Library.new

library.authors.push(Author.new('Seryoga', 'Gylik'))
library.authors.push(Author.new('Ser', ''))
library.books.push(Book.new('Брюс всемогущий', library.authors.last))

library.save!

# puts library.authors
# puts library.orders
# puts library.readers
# puts library.books
# puts library.orders.first.reader.name
#  puts library.top_book(1).title
puts library.top_book(2).each { |book| puts book.title }
