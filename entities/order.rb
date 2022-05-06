class Order
include Validation
attr_accessor :book, :reader, :date


  def initialize(book, reader, date = nil)
    @book = book
    @reader = reader
    @date = date
  end


end
