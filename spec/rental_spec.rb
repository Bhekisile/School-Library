require_relative '../rental'

describe Rental do
  let(:person) { Person.new(35, 'Nancy', parent_permission: true) }
  let(:book) { Book.new('Responsive Web Design', 'Ethan Marcotte') }
  let(:rental) { Rental.new('11/10/2023', book, person) }

  describe '#initialize' do
    it('returns the correct date') do
      expect(rental.date).to eq('11/10/2023')
    end

    it('returns the correct title book') do
      expect(rental.book.title).to eq('Responsive Web Design')
    end

    it('returns the correct name of the person') do
      expect(rental.person.name).to eq('Nancy')
    end
  end
end
