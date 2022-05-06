author_1 = Author.new("Толстой")
author_2 = Author.new('Пушкин', 'Застрелили на дуэли')
author_3 = Author.new('Достоевский')
author_4 = Author.new('Шевченко')
author_5 = Author.new('Бу', 'Пишу книги')

authors_to_yaml = [author_1, author_2, author_3, author_4, author_5].to_yaml

file = File.new('./data/authors.yml', 'w+')
file.write(authors_to_yaml)
file.close


reader_1 = Reader.new("Seva", "@gmail.com", "Dnipro", "Mira", 3)
reader_2 = Reader.new("Dima", "@gmail.com", "Dnipro", "Mira", 2)
reader_3 = Reader.new("Bogdan", "@gmail.com", "Dnipro", "Mira", 4)
reader_4 = Reader.new("Koly", "@gmail.com", "Dnipro", "Mira", 3)
reader_5 = Reader.new("Alina", "@gmail.com", "Dnipro", "Mira", 3)
reader_6 = Reader.new("Tanya", "@gmail.com", "Dnipro", "Mira", 3)

readers_to_yaml = [reader_1, reader_2, reader_3, reader_4, reader_5, reader_6].to_yaml

file = File.new('./data/readers.yml', 'w+')
file.write(readers_to_yaml)
file.close

book_1 = Book.new('Война', author_1)
book_2 = Book.new('Мир', author_1)
book_3 = Book.new('Война и мир', author_1)
book_4 = Book.new('Русалочка', author_2)
book_5 = Book.new('Идиот', author_3)
book_6 = Book.new('Преступление и наказание', author_3)
book_7 = Book.new('Енеида', author_4)
book_8 = Book.new('Кабзарь', author_4)
book_9 = Book.new('Сварог', author_5)
book_10 = Book.new('Дартаньян', author_5)

books_to_yaml = [book_1, book_2, book_3, book_4, book_5, book_6, book_7, book_8, book_9, book_10].to_yaml

file = File.new('./data/books.yml', 'w+')
file.write(books_to_yaml)
file.close

date =  Time.new.strftime("%y.%m.%d %H:%M")

order_1 = Order.new(book_1, reader_3, date)
order_2 = Order.new(book_3, reader_3, date)
order_3 = Order.new(book_4, reader_3, date)
order_4 = Order.new(book_4, reader_2, date)
order_5 = Order.new(book_4, reader_5, date)
order_6 = Order.new(book_4, reader_3, date)
order_7 = Order.new(book_7, reader_1, date)
order_8 = Order.new(book_7, reader_2, date)
order_9 = Order.new(book_10, reader_1, date)
order_10 = Order.new(book_10, reader_1, date)

orders_to_yaml = [order_1, order_2, order_3, order_4, order_5, order_6, order_7, order_8, order_9, order_10].to_yaml

file = File.new('./data/orders.yml', 'w+')
file.write(orders_to_yaml)
file.close
