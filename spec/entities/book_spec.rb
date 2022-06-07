RSpec.describe Book do
  let(:title) { 'Help me know Rspec' }
  let(:author) { Author.new('name', 'biography') }

  describe 'success' do
    it 'creates a new book' do
      expect { described_class.new(title, author) }.not_to raise_error
    end

    it 'sets attributes properly' do
      book = described_class.new(title, author)
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end
  end

  describe 'failure' do
    context 'when title is nil' do
      let(:title) { nil }

      it 'raises an error' do
        expect { described_class.new(title, author) }.to raise_error(
          ArgumentError, "The argument \(title\) does not belong to the class: String"
        )
      end
    end

    context 'when title is short' do
      let(:title) { '' }

      min_length = 1

      it 'raises an error' do
        expect { described_class.new(title, author) }.to raise_error(
          ArgumentError, "The size of the argument \(title\) must be greater than #{min_length} elements"
        )
      end
    end

    context 'when author is nil' do
      let(:author) { nil }

      it 'raises an error' do
        expect { described_class.new(title, author) }.to raise_error(
          ArgumentError, "The argument \(author\) does not belong to the class: Author"
        )
      end
    end
  end
end
