RSpec.describe Library do
  subject(:library) { described_class.new }

  let(:seconds_in_day) { 60 * 60 * 24 }
  let(:author) { Author.new('Марвел', 'снимаю шляпу') }
  let(:book) { Book.new('Человек паук', author) }
  let(:reader) { Reader.new('Военком', 'Vovan@gmail.com', 'Тортуга', 'Mira', 3) }

  before(:all) do
    Dir.mkdir('spec/data_spec') unless Dir.exist?('spec/data_spec')
  end

  before do
    stub_const('DatabaseFiller::AUTHORS_YML_PATH', './spec/data_spec/authors.yml')
    stub_const('DatabaseFiller::BOOKS_YML_PATH', './spec/data_spec/books.yml')
    stub_const('DatabaseFiller::READERS_YML_PATH', './spec/data_spec/readers.yml')
    stub_const('DatabaseFiller::ORDERS_YML_PATH', './spec/data_spec/orders.yml')

    fill_with_fake_data

    library.instance_variable_set(:@authors, Psych.load_file('./spec/data_spec/authors.yml'))
    library.instance_variable_set(:@books, Psych.load_file('./spec/data_spec/books.yml'))
    library.instance_variable_set(:@readers, Psych.load_file('./spec/data_spec/readers.yml'))
    library.instance_variable_set(:@orders, Psych.load_file('./spec/data_spec/orders.yml'))
  end

  after(:all) do
    FileUtils.rm_rf('./spec/data_spec') if Dir.exist?('./spec/data_spec')
  end

  describe 'success' do
    it 'creates a new library' do
      expect { described_class.new }.not_to raise_error
    end

    it 'All authors correspond to the class Author' do
      expect(library.authors).to all(be_a(Author))
    end

    it 'All books correspond to the class Book' do
      expect(library.books).to all(be_a(Book))
    end

    it 'All readers correspond to the class Reader' do
      expect(library.readers).to all(be_a(Reader))
    end

    it 'All orders correspond to the class Order' do
      expect(library.orders).to all(be_a(Order))
    end

    it "method 'add' add new element" do
      author_name = Author.new('Sergey', '')
      library.add(Author.new('Sergey', ''))
      expect(library.authors.last.name).to eq(author_name.name)
    end

    it "method 'save!' save new element" do
      stub_const('Storage::FILE_PATH', 'spec/data_spec/')
      library.add(Author.new('Ser'))

      last_author = library.authors.last
      library.save!

      library_new = described_class.new
      expect(library_new.authors.last).to eq(last_author)
    end

    it "method 'top_book' not raise error" do
      expect { library.top_book(1) }.not_to raise_error
    end

    it "method 'top_book' returns the right number of values" do
      expect(library.top_book.size).to eq(1)
      expect(library.top_book(1).size).to eq(1)
      expect(library.top_book(2).size).to eq(2)
    end

    it "method 'top_book' return top book in library" do
      100.times do |index|
        date = (Time.now - (seconds_in_day * index)).to_s.split.first
        order = Order.new(book, reader, date)
        library.add(order)
      end

      expect(library.top_book.first.class).to eq(Book)
      expect(library.top_book(1).first.title).to eq(book.title)
    end

    it "method 'top_reader' not raise error" do
      expect { library.top_reader(1) }.not_to raise_error
    end

    it "method 'top_reader' returns the right number of values" do
      expect(library.top_reader.size).to eq(1)
      expect(library.top_reader(1).size).to eq(1)
      expect(library.top_reader(2).size).to eq(2)
    end

    it "method 'top_reader' return top reader in library" do
      100.times do |index|
        date = (Time.now - (seconds_in_day * index)).to_s.split.first
        order = Order.new(book, reader, date)
        library.add(order)
      end

      expect(library.top_reader(1).first.class).to eq(Reader)
      expect(library.top_reader(1).first.name).to eq(reader.name)
    end

    it "method 'count_readers_top_book' not raise error" do
      expect { library.count_readers_top_book(3) }.not_to raise_error
    end

    it "method 'count_readers_top_book'" do
      top_book = library.top_book(1).first
      orders_of_top_book = library.orders.select { |order| order.book.title == top_book.title }
      expected_count = orders_of_top_book.map(&:reader).uniq(&:email).count

      expect(library.count_readers_top_book(1)).to eq(expected_count)
      expect(library.count_readers_top_book(3).class).to eq(Integer)
    end
  end

  describe 'failure' do
    it 'creates a new library with argument' do
      expect do
        described_class.new('kek')
      end.to raise_error(ArgumentError, 'wrong number of arguments (given 1, expected 0)')
    end

    it "method 'add' add new no valid element raises an error" do
      expect { library.add('kek') }.to raise_error(ArgumentError, 'wrong class passed')
    end

    it "method 'top_book' convey text value" do
      expect { library.top_book('hello') }.to raise_error(TypeError, 'no implicit conversion of String into Integer')
    end

    it "method 'top_book' convey negative value" do
      expect { library.top_book(-1) }.to raise_error(ArgumentError, 'negative size (-1)')
    end

    it "method 'top_reader' convey text value" do
      expect { library.top_reader('hello') }.to raise_error(TypeError, 'no implicit conversion of String into Integer')
    end

    it "method 'top_reader' convey negative value" do
      expect { library.top_reader(-1) }.to raise_error(ArgumentError, 'negative size (-1)')
    end

    it "method 'count_readers_top_book' convey text value" do
      expect do
        library.count_readers_top_book('hello')
      end.to raise_error(TypeError, 'no implicit conversion of String into Integer')
    end

    it "method 'count_readers_top_book' convey negative value" do
      expect { library.count_readers_top_book(-1) }.to raise_error(ArgumentError, 'negative size (-1)')
    end
  end
end
