require_relative '../trimmer_decorator'
require_relative '../decorator'

describe TrimmerDecorator do
  let(:nameable) { Person.new(25, name, parent_permission: true) }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    let(:name) { 'Christopher' }
    it('trims the name when it exceeds 10 character') do
      expect(decorator.correct_name).to eq('Christophe')
    end
  end

  describe '#correct_name' do
    let(:name) { 'Lucy' }
    it('returns the same name when it is less than 10 character') do
      expect(decorator.correct_name).to eq('Lucy')
    end
  end
end
