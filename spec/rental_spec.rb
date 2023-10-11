require_relative '../rental'

describe Rental do
  let(:person) { Person.new(35, 'Nancy', parent_permission: true) }
  let(:book) { Book.new('Responsive Web Design', 'Ethan Marcotte') }
  let(:rental) { Rental.new('11/10/2023', book, person) }
  
  describe '#initialize' do
    it ('returns the correct date') do
      expect(rental.date).to eq('11/10/2023')
    end
  
    it ('returns the correct title book') do
      expect(rental.book.title).to eq('Responsive Web Design')
    end

    it ('returns the correct name of the person') do
      expect(rental.person.name).to eq('Nancy')
    end
  end
end


  # describe '#rentals' do
  #   let(:person) { Person.new(35, 'Nancy', parent_permission: true) }
  #   it 'creates a new rental object and adds it to the rentals array' do
  #     rental = book.add_rental(person, '2023-04-26')
  #     expect(book.rentals.length).to eq(1)
  #   end
#   end
# end