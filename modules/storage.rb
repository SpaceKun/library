module Storage
  FILE_PATH = './data/'

  def load_yaml_file(name_file:)
    name = name_file.to_s.downcase
    file =  FILE_PATH + name
    if File.exist?(file)
      Psych.load_file(file)
    else
      array = [].to_yaml
      file = File.new(file, 'w+')
      file.write(array)
      file.close
      Psych.load_file(file)
    end
  end

  def save(lib_entities:, class_entity:)
    name = class_entity.downcase.to_s
    file = File.write( FILE_PATH + name + 's.yml', lib_entities.to_yaml)
  end
end
