module Storage
    FILE_PATH = './data/'

  def load_yaml_file(name_file:)
    name = name_file.to_s.downcase.delete('.yml')
    Psych.load_file( FILE_PATH + name + '.yml')
  end

  def save(lib_entities:, class_entity:)
    name = class_entity.downcase.to_s
    file = File.write( FILE_PATH + name + 's.yml', lib_entities.to_yaml)
  end
end
