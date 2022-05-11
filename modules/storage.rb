module Storage
  def load_yaml_file(name_file:)
    name = name_file.to_s.downcase.delete('.yml')
    Psych.load_file("./data/#{name}.yml")
  end

  def save(lib_entitie:, class_entitie:)
    name = class_entitie.downcase.to_s
    file = File.write("./data/#{name}s.yml", lib_entitie.to_yaml)
  end
end
