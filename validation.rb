module Validation_liberty
  def valid_name?(name)
    if ( name == nil || name == "")
      raise "Вы не ввели имя автора книги"
    else
      name
    end
  end  
end
