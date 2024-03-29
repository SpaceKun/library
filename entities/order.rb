class Order
  include Validation

  attr_reader :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = Date.parse(date)
    validate_class!
  end

  def ==(other)
    if other.is_a? Order
      @book == other.book &&
        @reader == other.reader &&
        @date == other.date
    else
      false
    end
  end

  private

  def validate_class!
    validate_class(@book, 'book', Book)
    validate_class(@reader, 'reader', Reader)
    validate_class(@date, 'date', Date)
  end
end
