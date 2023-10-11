require_relative '../book'
require_relative '../person'

describe Book do
  let(:book) { Book.new('Responsive Web Design', 'Ethan Marcotte') }

  describe '#title' do
    it 'returns the correct title' do
      expect(book.title).to eq('Responsive Web Design')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(book.author).to eq('Ethan Marcotte')
    end
  end

  describe '#rentals' do
    let(:person) { Person.new(35, 'Nancy', parent_permission: true) }
    it 'creates a new rental object and adds it to the rentals array' do
      rental = book.add_rental(person, '2023-04-26')
      expect(book.rentals.length).to eq(1)
    end
  end
end
