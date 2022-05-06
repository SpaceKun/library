module Validation
  def validation_length(arg, size_string, name_arg, class_name)
    if class_name == String
      unless arg.length >= size_string.to_i
        raise ArgumentError.new(" The size of the argument(#{name_arg}) must be greater than #{size_string} elements")
      end
    elsif class_name == Integer
      unless arg >= size_string.to_i
        raise ArgumentError.new("#{name_arg} Please writing positive argument")
      end
    end
  end

  def validation_class(arg, name_arg, class_name)
    unless arg.is_a?(class_name)
      raise ArgumentError.new("The argument(#{name_arg}) does not belong to the class: #{class_name}")
    end
  end

end
