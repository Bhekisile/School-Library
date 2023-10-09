require_relative 'teacher'

class TeacherApp
  def create_teacher(people)
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization'
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    people << teacher
    puts 'Teacher created successfully'
  end
end