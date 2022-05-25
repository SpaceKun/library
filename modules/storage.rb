module Storage
  def load_yaml_file(name_file:)
    name = name_file.to_s.downcase.delete('.yml')
    Psych.load_file("./data/#{name}.yml")
  end

  def save(lib_entities:, class_entity:)
    name = class_entity.downcase.to_s
    file = File.write("./data/#{name}s.yml", lib_entities.to_yaml)
  end
end
