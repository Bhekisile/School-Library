require_relative '../capitalize_decorator'
require_relative '../decorator'

describe CapitalizeDecorator do
  let(:nameable) { Person.new(25, 'lucy', parent_permission: true) }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it('capitalizes the name') do
      expect(decorator.correct_name).to eq('Lucy')
    end
  end
end
