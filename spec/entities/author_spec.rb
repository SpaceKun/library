RSpec.describe Author do
  subject(:author) { described_class.new(name, biography) }
  let(:name) { 'John' }
  let(:biography) { 'biography' }

  describe 'success' do
    it 'creates a new author' do
      expect { author }.not_to raise_error
    end

    it 'sets attributes properly' do
      expect(author.name).to eq(name)
      expect(author.biography).to eq(biography)
    end

    context 'when biography is nil' do
      let(:biography) { '' }

      it 'creates author without biography' do
        expect { author }.not_to raise_error
      end
    end
  end

  describe 'failure' do
    context 'when name is nil' do
      let(:name) { nil }

      it 'raises an error' do
        expect { author }.to raise_error(
          ArgumentError, "The argument \(name\) does not belong to the class: String"
        )
      end
    end

    context 'when name is short' do
      let(:name) { '' }

      min_length = 1

      it 'raises an error' do
        expect { author }.to raise_error(
          ArgumentError, "The size of the argument \(name\) must be greater than #{min_length} elements"
        )
      end
    end
  end
end
