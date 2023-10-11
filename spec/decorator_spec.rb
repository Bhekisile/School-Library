require_relative '../decorator'
require_relative '../nameable'

describe Decorator do
  let(:nameable) {Person.new(25, 'Lucy', parent_permission: true) }
  let(:decorator) {Decorator.new(nameable)}

  describe '#initialize' do
    it ('corrects instance') do
    expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it ('corrects the name of a person') do
      expect(decorator.correct_name).to eq('Lucy')
    end
  end
end