class Order
  include Validation

  attr_reader :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = Date.parse(date)
    validate_class!
  end

  def to_s
    <<~INFO
    Заказ на книгу:
    #{book}
    Купил:
    #{reader}
    был оформлен такого числа:
    #{date}
    INFO
  end

  private

  def validate_class!
    validate_class(@book, 'book', Book)
    validate_class(@reader, 'reader', Reader)
    validate_class(@date, 'date', Date)
  end
end
