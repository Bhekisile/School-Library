require_relative '../teacher'

describe Teacher do
  let(:teacher) { Teacher.new(35, 'Maths', 'Deborah') }

  describe '#initialize' do
    it 'creates a new teacher instance' do
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'assigns teacher\'s age' do
      expect(teacher.age).to eq(35)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
