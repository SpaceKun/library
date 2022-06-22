module Storage
  FILE_PATH = './data/'.freeze

  def load_yaml_file(name_file:)
    name = name_file.to_s.downcase
    file = FILE_PATH + name
    unless File.exist?(file)
      file = File.new(file, 'w+')
      file.write([].to_yaml)
      file.close
    end
    Psych.load_file(file)
  end

  def save(lib_entities:, class_entity:)
    name = class_entity.downcase.to_s
    file = File.write("#{FILE_PATH}#{name}s.yml", lib_entities.to_yaml)
  end
end
