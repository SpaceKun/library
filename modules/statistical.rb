module Statistical
  # def top_reader
  # reader = []
  # number_in_array_order = 0

  # while @orders.size != number_in_array_order do
  #   name_reader = orders[number_in_array_order].reader.name
  #   reader.push(name_reader)
  #   number_in_array_order += 1
  # end
  # # num = reader.tally
  # # puts num.map { |k,v| [k, v.count] }
  # puts reader.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  # end

  def top_book(order, number_of_top)
    title_book = []
    counter_book = []
    number = 0
    number_in_array_books = 0

    while @orders.size != number_in_array_books do
      name_book = orders[number_in_array_books].book.title
      title_book.push(name_book)
      number_in_array_books += 1
    end

    while orders.size != number do
      hash = title_book.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
      proc = hash.to_proc
      count_name_book = proc.call(orders[number].book.title)
      counter_book.push(count_name_book)
      number += 1
    end
    index = counter_book.uniq.max(3).map{|e| counter_book.find_index(e)}
    if number_of_top <= 1
      puts "Самая популярная книга среди покупателей: #{orders[index[0]].book.title}" #, количество ее заказов #{counter_book.max}
    elsif number_of_top == 2
      puts "Первая по популярности книга среди покупателей: #{orders[index[0]].book.title}"
      puts "Вторая по популярности книга среди покупателей: #{orders[index[1]].book.title}"
    else number_of_top >= 3
      puts "Первая по популярности книга среди покупателей: #{orders[index[0]].book.title}"
      puts "Вторая по популярности книга среди покупателей: #{orders[index[1]].book.title}"
      puts "Третья по популярности книга среди покупателей: #{orders[index[2]].book.title}"
    end
  end
end


  # top = counter_book.index(counter_book.uniq.max)
  # puts "Самая популярная книга среди покупателей: #{@orders[top].book.title}, количество ее заказов #{counter_book.max}"

  # def top_reader
  # reader = []
  # email = []
  # a = [1, 2, 3]
  # number_in_array_order = 0

  # while @orders.size != number_in_array_order do
  #   name_reader = orders[number_in_array_order].reader.name
  #   email_reader = orders[number_in_array_order].reader.email
  #   reader.push(name_reader)
  #   email.push(email_reader)
  #   number_in_array_order += 1
  # end

  # # num = reader.tally
  # # puts num.map { |k,v| [k, v.count] }
  # # puts reader.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
  # # end
  # # cont = reader.each {|name| print name.to_s } + email
  # puts reader.count { |name| name.downcase.to_s == 'bogdan'}
  # end
