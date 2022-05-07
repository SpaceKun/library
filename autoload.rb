require "pry"
require "./moduls/yaml.rb"
require 'yaml'
require 'date'
require "./gem/Gemfile.rb"
require "./moduls/validation.rb"
require "./entities/author.rb"
require "./entities/book.rb"
require "./entities/reader.rb"
require "./entities/order.rb"
require "./entities/library.rb"
require "./load_data_base.rb"

require 'psych'
gem 'psych', '< 4'
