require_relative 'student_app'
require_relative 'teacher_app'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_a_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? (Input the number): '
    puts
    person_type = gets.chomp

    case person_type
    when '1'
      StudentApp.new.create_student(@people)
    when '2'
      TeacherApp.new.create_teacher(@people)
    else
      puts
      puts 'Option invalid, please try again'
      puts
    end
  end
end
