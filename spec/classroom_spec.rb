require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('English') }
  let(:student) { Student.new(17, classroom, 'Nancy', parent_permission: true) }

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(classroom.students.length).to eq(1)
    end

    it 'sets the classroom property of the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end