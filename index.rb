require './autoload'

library = Library.new

library.authors.push(Author.new('Seryoga', 'Gylik'))
library.authors.push(Author.new('Ser', ))
library.books.push(Book.new('Брюс всемогущий', library.authors.last))

library.save!

puts library.authors
puts library.books
