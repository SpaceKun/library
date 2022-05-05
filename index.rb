require "./autoload.rb"

authors = YAML.load_file('./data/authors.yml', permitted_classes: [Author])


