class Order
include Validation
attr_accessor :book, :reader, :date

  def initialize(book, reader, date = nil)
    @book = book
    @reader = reader
    @date = Date.parse(date)
    validation_class!
  end

  private

  def validation_class!
    validation_class(@book, 'book', Book)
    validation_class(@reader, 'reader', Reader)
    validation_class(@date, 'date', Date)
  end
end
