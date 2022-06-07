RSpec.describe Order do
  let(:book) { Book.new('title', Author.new('name', 'biography')) }
  let(:reader) { Reader.new('Seva', 'Seva@gmail.com', 'Dnipro', 'Mira', 3) }
  let(:date) { '15.05.22' }

  describe 'success' do
    it 'creates a new order' do
      expect { described_class.new(book, reader, date) }.not_to raise_error
    end

    it 'sets attributes properly' do
      order = described_class.new(book, reader, date)
      expect(order.book).to eq(book)
      expect(order.reader).to eq(reader)
      expect(order.date).to eq(Date.parse(date))
    end
  end

  describe 'failure' do
    context 'when book is nil' do
      let(:book) { nil }

      it 'raise an error' do
        expect { described_class.new(book, reader, date) }.to raise_error(
          ArgumentError, "The argument \(book\) does not belong to the class: Book"
        )
      end
    end

    context 'when reader is nil' do
      let(:reader) { nil }

      it 'raise an error' do
        expect { described_class.new(book, reader, date) }.to raise_error(
          ArgumentError, "The argument \(reader\) does not belong to the class: Reader"
        )
      end
    end

    context 'when data is nil' do
      let(:date) { nil }

      it 'raise an error' do
        expect { described_class.new(book, reader, date) }.to raise_error(
          TypeError, 'no implicit conversion of nil into String'
        )
      end
    end
  end
end
