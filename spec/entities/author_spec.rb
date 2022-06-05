RSpec.describe Author do
  let(:name) { 'John' }
  let(:biography) { 'biography' }

  describe 'success' do
    it 'should create a new author' do
      expect { Author.new(name, biography) }.not_to raise_error
    end

    it 'sets attributes properly' do
      author = Author.new(name, biography)
      expect(author.name).to eq(name)
      expect(author.biography).to eq(biography)
    end

    context 'When biography is nil' do
      let(:biography) { '' }

      it 'should create author without biography' do
        expect { Author.new(name, biography) }.not_to raise_error
      end
    end
  end

  describe 'failure' do
    context 'when name is nil' do
      let(:name) { nil }

      it 'should raise an error' do
        expect { Author.new(name, biography) }.to raise_error(
          ArgumentError, "The argument \(name\) does not belong to the class: String"
        )
      end
    end

    context 'when name is short' do
      let(:name) { '' }
      min_length = 1

      it 'should raise an error' do
        expect { Author.new(name, biography) }.to raise_error(
          ArgumentError, "The size of the argument \(name\) must be greater than #{min_length} elements"
        )
      end
    end
  end
end
