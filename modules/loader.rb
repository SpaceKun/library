module Loader
  def load_yaml_file(name_file)
    name = name_file.delete('.yml')
    name = Psych.load_file("./data/#{name}.yml")
  end
end
