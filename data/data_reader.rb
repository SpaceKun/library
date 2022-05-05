
reader_1 = Reader.new("Seva", "@gmail.com", "Dnipro", "Mira", "1")
reader_2 = Reader.new("Dima", "@gmail.com", "Dnipro", "Mira", "2")
reader_3 = Reader.new("Bogdan", "@gmail.com", "Dnipro", "Mira", "3")

readers_to_yaml = [reader_1, reader_2, reader_3].to_yaml

file = File.new('./data/readers.yml', 'w+')
file.write(readers_to_yaml)
file.close
