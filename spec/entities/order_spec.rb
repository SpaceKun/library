RSpec.describe Order do
  subject(:order) {described_class.new(book, reader, date)}
  let(:author) { Author.new('name', 'biography') }
  let(:book) { Book.new('title', author) }
  let(:reader) { Reader.new('Seva', 'Seva@gmail.com', 'Dnipro', 'Mira', 3) }
  let(:date) { '15.05.22' }

  describe 'success' do
    it 'creates a new order' do
      expect { order }.not_to raise_error
    end

    it 'sets attributes properly' do
      expect(order.book).to eq(book)
      expect(order.reader).to eq(reader)
      expect(order.date).to eq(Date.parse(date))
    end
  end

  describe 'failure' do
    context 'when book is nil' do
      let(:book) { nil }

      it 'raise an error' do
        expect { order }.to raise_error(
          ArgumentError, "The argument \(book\) does not belong to the class: Book"
        )
      end
    end

    context 'when reader is nil' do
      let(:reader) { nil }

      it 'raise an error' do
        expect { order }.to raise_error(
          ArgumentError, "The argument \(reader\) does not belong to the class: Reader"
        )
      end
    end

    context 'when data is nil' do
      let(:date) { nil }

      it 'raise an error' do
        expect { order }.to raise_error(
          TypeError, 'no implicit conversion of nil into String'
        )
      end
    end
  end
end
