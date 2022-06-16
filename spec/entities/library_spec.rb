RSpec.describe Library do
  subject(:library) { Library.new }

  before(:all) do
    Dir.mkdir('spec/data_spec') unless Dir.exist?('spec/data_spec')
  end

  before(:each) do
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
    # File.delete('spec/data_spec/authors.yml') if File.exist?('./spec/data_spec/authors.yml')
    # File.delete('spec/data_spec/readers.yml') if File.exist?('./spec/data_spec/readers.yml')
    # File.delete('spec/data_spec/books.yml') if File.exist?('./spec/data_spec/books.yml')
    # File.delete('spec/data_spec/orders.yml') if File.exist?('./spec/data_spec/orders.yml')
    # Dir.unlink('spec/data_spec') if Dir.exist?('./spec/data_spec')
  end

  describe 'success' do
    it 'creates a new library' do
      expect { Library.new }.not_to raise_error
    end

    it 'All authors correspond to the class Author' do
      expect(library.authors.all? { |author| author.is_a?(Author)}).to be(true)
    end

    it 'All books correspond to the class Book' do
      expect(library.books.all? { |books| books.is_a?(Book)}).to be(true)
    end

    it 'All readers correspond to the class Reader' do
      expect(library.readers.all? { |readers| readers.is_a?(Reader)}).to be(true)
    end

    it 'All orders correspond to the class Order' do
      expect(library.orders.all? { |orders| orders.is_a?(Order)}).to be(true)
    end

    it "method 'save!' save new element" do
      stub_const('Storage::FILE_PATH', 'spec/data_spec/')
      library.authors.push(Author.new('Ser'))

      last_author = library.authors.last

      library.save!

      expect(library.authors.last).to eq(last_author)
    end
  end
end
