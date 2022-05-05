# require './autoload.rb'

author_1 = Author.new("")
author_2 = Author.new('Пушкин')

authors_to_yaml = [author_1, author_2].to_yaml

file = File.new('./data/authors.yml', 'w+')
file.write(authors_to_yaml)
file.close
