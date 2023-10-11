require_relative '../student'

describe Student do
  let(:student) { Student.new(19, nil, 'Deborah', parent_permission: true) }

  describe '#initialize' do
    it('returns the correct age') do
      expect(student.age).to eq(19)
    end

    it('returns the correct name') do
      expect(student.name).to eq('Deborah')
    end
  end

  describe '#play_hooky' do
    it('plays hooky') do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom' do
    let(:classroom) { Classroom.new('class1') }
    it('adds students to classroom') do
      student.classroom = classroom
      expect(classroom.students.length).to eq(1)
    end
  end
end
