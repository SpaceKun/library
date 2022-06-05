RSpec.describe Reader do
  let(:name) { 'Bo' }
  let(:email) { 'Bo_email@gmail.com' }
  let(:city) { 'Dnipro' }
  let(:street) { 'Mira' }
  let(:house) { 7 }

  describe 'success' do
    it 'should create a new reader' do
      expect { Reader.new(name, email, city, street, house) }.not_to raise_error
    end
  end

  it 'sets attributes properly' do
    reader = Reader.new(name, email, city, street, house)
    expect(reader.name).to eq(name)
    expect(reader.email).to eq(email)
    expect(reader.city).to eq(city)
    expect(reader.street).to eq(street)
    expect(reader.house).to eq(house)
  end

  describe 'failure' do
    context 'when name is nil' do
      let(:name) { nil }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(name\) does not belong to the class: String"
        )
      end
    end

    context 'when name is too short' do
      let(:name) { '' }
      min_length = 1

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The size of the argument \(name\) must be greater than #{min_length} elements"
        )
      end
    end

    context 'when email is nil' do
      let(:email) { nil }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(email\) does not belong to the class: String"
        )
      end
    end

    context 'when email is too short' do
      let(:email) { '' }
      min_length = 1

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The size of the argument \(email\) must be greater than #{min_length} elements"
        )
      end
    end

    context 'when city is nil' do
      let(:city) { nil }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(city\) does not belong to the class: String"
        )
      end
    end

    context 'when city is too short' do
      let(:city) { '' }
      min_length = 1

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The size of the argument \(city\) must be greater than #{min_length} elements"
        )
      end
    end

    context 'when street is nil' do
      let(:street) { nil }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(street\) does not belong to the class: String"
        )
      end
    end

    context 'when street is too short' do
      let(:street) { '' }
      min_length = 1

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The size of the argument \(street\) must be greater than #{min_length} elements"
        )
      end
    end

    context 'when house is nil' do
      let(:house) { nil }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(house\) does not belong to the class: Integer"
        )
      end
    end

    context 'when house is negative' do
      let(:house) { -1 }

      it 'should raise an error' do
        expect { Reader.new(name, email, city, street, house) }.to raise_error(
          ArgumentError, "The argument \(house\) does not positive"
        )
      end
    end
  end
end
