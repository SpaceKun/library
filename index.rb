require "./autoload.rb"


library = Library.new

# # author = library.add_author("Vasil", "pisaet sidy")
# # book = library.add_book('Kak kakat?', author)

# library.save
# library.save(book, 'books')
# binding pry

# puts library.authors.last.name

library.add_author(library,"Big bos", 'xer')




library.save(name_library: library, name_file: 'authors.yml')


puts library.authors.last

name = Psych.load_file("./data/authors.yml")

puts name.last.name.name
