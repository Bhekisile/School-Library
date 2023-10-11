require_relative '../person'

describe Person do
  let(:person) { Person.new(age, 'Lucy', parent_permission: permission) }

  describe '#initialize' do
    let(:age) { 35 }
    let(:permission) { true }

    it('returns the correct age') do
      expect(person.age).to eq(age)
    end

    it('returns the correct name') do
      expect(person.name).to eq('Lucy')
    end

    it('returns an empty array for rentals') do
      expect(person.rentals.length).to eq(0)
    end
  end

  describe '#can_use_services?' do
    let(:age) { 35 }
    let(:permission) { true }
    it('returns true when a person is of age or has permission') do
      expect(person.can_use_services?).to eq(true)
    end
  end

  describe '#can_use_services?' do
    let(:age) { 16 }
    let(:permission) { false }
    it('returns false when a person is not of age or has no permission') do
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#correct_name' do
    let(:age) { 16 }
    let(:permission) { false }
    it('returns the correct name') do
      expect(person.correct_name).to eq('Lucy')
    end
  end

  describe '#add_rental' do
    let(:book) { Book.new('Responsive Web Design', 'Ethan Marcotte') }
    let(:age) { 16 }
    let(:permission) { false }
    it 'creates a new rental object and adds it to the rentals array' do
      person.add_rental('2023-04-26', book)
      expect(person.rentals.length).to eq(1)
    end
  end
end
