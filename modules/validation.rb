module Validation
  def validate_length(arg, name_arg, _class_name, min_length: 1)
    unless arg.length > min_length
      raise ArgumentError, "The size of the argument (#{name_arg}) must be greater than #{min_length} elements"
    end
  end

  def validate_class(arg, name_arg, class_name)
    unless arg.is_a?(class_name)
      raise ArgumentError, "The argument (#{name_arg}) does not belong to the class: #{class_name}"
    end
  end

  def validate_positive(arg, name_arg)
    raise ArgumentError, "The argument (#{name_arg}) does not positive" unless arg.positive?
  end
end
